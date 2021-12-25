import 'package:food_yours_customer/cart/model/cart_model.dart';
import 'package:food_yours_customer/order/orders/screen/order_summary_screen.dart';
import 'package:get/route_manager.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class OrdersTabController extends GetxController {
  gotoOrderSummaryScreen(CartModel cartItem) =>
      Get.to(() => OrderSummaryScreen(), arguments: {"order": cartItem});
}
