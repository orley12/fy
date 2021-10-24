import 'package:food_yours_customer/notification/model/notification_view_model.dart';
import 'package:food_yours_customer/resources/strings.dart';
import 'package:hive_flutter/adapters.dart';

class HiveService {
  static setUpHiveAdapters() {
    Hive.registerAdapter(NotificationViewModelAdapter());
  }

  static openHiveBoxes() async {
    await Hive.openLazyBox(Strings.NOTIFICATIONS_BOX);
  }
}
