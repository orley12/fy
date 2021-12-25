import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:food_yours_customer/resources/strings.dart';
import 'package:get/route_manager.dart';

class FoodYoursPaymentService {
  final PaystackPlugin plugin = PaystackPlugin();

  FoodYoursPaymentService() {
    plugin.initialize(publicKey: Strings.PAY_STACK_PUB_API_KEY);
  }

  Future<CheckoutResponse> checkOut(Charge charge) async {
    return await plugin.checkout(
      Get.context!,
      method: CheckoutMethod.card, // Defaults to CheckoutMethod.selectable
      charge: charge,
    );
  }

  void initiatePayStackPayment() {}
}
