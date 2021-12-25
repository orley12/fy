import 'package:food_yours_customer/cart/model/cart_model.dart';
import 'package:food_yours_customer/notification/model/notification_view_model.dart';
import 'package:food_yours_customer/resources/strings.dart';
import 'package:hive_flutter/adapters.dart';

class HiveService {
  static setUpHiveAdapters() {
    Hive.registerAdapter(NotificationViewModelAdapter());
    Hive.registerAdapter(CartModelAdapter());
  }

  static openNotificationBox() async =>
      await Hive.openBox(Strings.NOTIFICATIONS_BOX);
  static openSearchHistoryBox() async =>
      await Hive.openBox(Strings.SEARCH_HISTORY_BOX);
  static openCartBox() async => await Hive.openBox(Strings.CART_BOX);
  static openRandomInformationBox() async =>
      await Hive.openBox(Strings.RANDOM_INFORMATION_BOX);

  static Box getNotificationsBox() => Hive.box(Strings.NOTIFICATIONS_BOX);
  static Box getSearchHistoryBox() => Hive.box(Strings.SEARCH_HISTORY_BOX);
  static Box getCartBox() => Hive.box(Strings.CART_BOX);
  static Box getRandomInformationBox() =>
      Hive.box(Strings.RANDOM_INFORMATION_BOX);
}
