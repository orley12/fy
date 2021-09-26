import 'package:food_yours_customer/cart/screen/payment_method_screen.dart';
import 'package:food_yours_customer/util/navigation_util.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class CartOrderSummaryScreenController extends GetxController {
  gotoPaymentMethodScreen() => push(page: PaymentMethodScreen());
}
