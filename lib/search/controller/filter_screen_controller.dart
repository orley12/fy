import 'package:food_yours_customer/home/view_model/meal_view_model.dart';
import 'package:food_yours_customer/notification/screen/notification_screen.dart';
import 'package:food_yours_customer/util/navigation_util.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';

class FilterScreenController extends GetxController {
  void gotoNotificationScreen() => push(page: NotificationScreen());
}
