import 'package:food_yours_customer/cart/screen/cart_order_summary_screen.dart';
import 'package:food_yours_customer/util/navigation_util.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class CartTabController extends GetxController {
  gotoCartOrderSummaryScreen() => push(page: CartOrderSummaryScreen());
}
