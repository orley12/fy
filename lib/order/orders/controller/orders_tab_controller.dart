import 'package:food_yours_customer/order/orders/screen/order_summary_screen.dart';
import 'package:food_yours_customer/util/navigation_util.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class OrdersTabController extends GetxController {
  gotoOrderSummaryScreen() => push(page: OrderSummaryScreen());
}
