import 'package:food_yours_customer/common/repository/hive_repository/hive_repository.dart';
import 'package:food_yours_customer/notification/model/notification_view_model.dart';
import 'package:food_yours_customer/resources/strings.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class NotificationScreenController extends GetxController {
  final HiveRepository hiveRepository =
      HiveRepository<NotificationViewModel>(Strings.NOTIFICATIONS_BOX);

  RxList<NotificationViewModel> notifications = <NotificationViewModel>[].obs;

  RxBool enableNotification = false.obs;
  RxBool isLoading = false.obs;

  RxString loadingMessage = "loading notifications ...".obs;
  RxString loadingError = "".obs;

  toggleNotification(bool value) => enableNotification.value = value;

  @override
  void onReady() {
    loadNotifiactions();
    super.onReady();
  }

  void loadNotifiactions() {
    try {
      notifications.value =
          hiveRepository.getAll().toList().cast<NotificationViewModel>();
      print("all notifications =========> ${notifications.value}");
    } catch (e) {
      loadingError.value = "Unable to load notifications";
    }
  }
}
