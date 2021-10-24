import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:food_yours_customer/cart/service/paystack_payment_service/paystack_payment_service.dart';
import 'package:food_yours_customer/resources/strings.dart';
import 'package:get/route_manager.dart';

class PayStackPaymentServiceImpl implements PayStackPaymentService {
  final PaystackPlugin plugin = PaystackPlugin();

  PayStackPaymentServiceImpl() {
    plugin.initialize(publicKey: Strings.PAY_STACK_PUB_API_KEY);
  }

  checkOut(Charge charge) async {
    return await plugin.checkout(
      Get.context!,
      method: CheckoutMethod.card, // Defaults to CheckoutMethod.selectable
      charge: charge,
    );
  }
}
