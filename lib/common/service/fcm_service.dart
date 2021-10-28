import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:food_yours_customer/common/repository/hive_repository/hive_repository.dart';
import 'package:food_yours_customer/common/service/hive_service.dart';
import 'package:food_yours_customer/common/widget/notification_widgets.dart';
import 'package:food_yours_customer/notification/model/notification_view_model.dart';
import 'package:food_yours_customer/notification/screen/notification_screen.dart';
import 'package:food_yours_customer/resources/enums.dart';
import 'package:food_yours_customer/resources/strings.dart';
import 'package:food_yours_customer/util/date_time_util.dart';
import 'package:food_yours_customer/util/navigation_util.dart';
import 'package:hive/hive.dart';

class FCMService {
  requestPermission() async {
    final FirebaseMessaging fcmessaging = FirebaseMessaging.instance;

    NotificationSettings settings = await fcmessaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
      // TODO: handle the received notifications
    } else {
      print('User declined or has not accepted permission');
    }
  }

  getFcmToken() async {
    final FirebaseMessaging fcmessaging = FirebaseMessaging.instance;

    String token = await fcmessaging.getToken() ?? "";
    print("FCMTOKEN =============> $token");
  }

  void registerNotification() async {
    // For handling the received notifications
    FirebaseMessaging.onMessage.listen((RemoteMessage remoteMessage) {
      // Parse the message received
      if (remoteMessage.notification != null) {
        NotificationViewModel notificationViewModel = NotificationViewModel(
          remoteMessage.messageId,
          remoteMessage.notification!.title,
          remoteMessage.notification!.body,
          DateTimeUtil.dateTimeToString(remoteMessage.sentTime),
        );
        final box = Hive.box(Strings.NOTIFICATIONS_BOX).put(notificationViewModel.id!, notificationViewModel);

        // HiveRepository<NotificationViewModel>(Strings.NOTIFICATIONS_BOX);
        // hs.put(notificationViewModel.id!, notificationViewModel);
        print('Message also contained a notification: ${remoteMessage.notification}');
        showNotification(remoteMessage.notification!);
      }
    });

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    RemoteMessage? initialMessage = await FirebaseMessaging.instance.getInitialMessage();

    if (initialMessage != null) {
      NotificationViewModel(
        initialMessage.notification!.title,
        initialMessage.notification!.body,
        DateTimeUtil.dateTimeToString(initialMessage.sentTime),
      );
      showNotification(initialMessage.notification!);
    }

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage remoteMessage) {
      if (remoteMessage.notification != null) {
        NotificationViewModel(
          remoteMessage.notification!.title,
          remoteMessage.notification!.body,
          DateTimeUtil.dateTimeToString(remoteMessage.sentTime),
        );
        print('Message also contained a notification: ${remoteMessage.notification}');
        showNotification(remoteMessage.notification!);
      }
    });
  }

  showNotification(RemoteNotification data) {
    showFYSnackBar(
      responseGrades: ResponseGrades.INFO,
      action: () => push(page: NotificationScreen()),
      message: data.body ?? "",
    );
  }
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();

  print("Handling a background message: ${message.messageId}");
}
