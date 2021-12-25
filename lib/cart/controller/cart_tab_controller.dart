import 'package:food_yours_customer/cart/interface/interface_cart_order.dart';
import 'package:food_yours_customer/cart/screen/cart_order_summary_screen.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';

class CartTabController extends GetxController implements ICartOrder {
  gotoCartOrderSummaryScreen() => Get.to(() => CartOrderSummaryScreen());

  @override
  placeOrder() {
    // TODO: implement placeOrder
    throw UnimplementedError();
  }
}
