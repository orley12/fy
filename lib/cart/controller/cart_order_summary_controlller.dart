import 'package:food_yours_customer/cart/interface/interface_cart_order.dart';
import 'package:food_yours_customer/cart/screen/payment_method_screen.dart';
import 'package:food_yours_customer/util/navigation_util.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class CartOrderSummaryScreenController extends GetxController implements ICartOrder {
  gotoPaymentMethodScreen() => push(page: PaymentMethodScreen());

  @override
  placeOrder() => push(page: PaymentMethodScreen());
}
