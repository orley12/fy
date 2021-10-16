import 'package:food_yours_customer/home/controller/home_tab_controller.dart';
import 'package:food_yours_customer/order/special_order/screen/special_order_screen.dart';
import 'package:food_yours_customer/util/navigation_util.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';

class HomeTabFrontPanelController extends GetxController {
  late HomeTabController homeTabCrtl = Get.find<HomeTabController>();

  gotoLargeOrderScreen() => push(page: SpecialOrderScreen());
}
