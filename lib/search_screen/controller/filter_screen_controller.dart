import 'package:food_yours_customer/notification/screen/notification_screen.dart';
import 'package:food_yours_customer/util/navigation_util.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class FilterScreenController extends GetxController {
  void gotoNotificationScreen() => push(page: NotificationScreen());
}
