import 'package:food_yours_customer/common/widget/notification_widgets.dart';
import 'package:food_yours_customer/home/controller/home_tab_controller.dart';
import 'package:food_yours_customer/home/view_model/food_category_view_model.dart';
import 'package:food_yours_customer/home/view_model/popular_chef_view_model.dart';
import 'package:food_yours_customer/special_order/screen/special_order_screen.dart';
import 'package:food_yours_customer/util/navigation_util.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';

class HomeTabFrontPanelController extends GetxController {
  late HomeTabController homeTabCrtl = Get.find<HomeTabController>();

  gotoLargeOrderScreen() => push(page: SpecialOrderScreen());
}
