import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:food_yours_customer/cart/service/paystack_payment_service/paystack_payment_service.dart';
import 'package:food_yours_customer/resources/strings.dart';
import 'package:get/route_manager.dart';

class FoodYoursPaymentServiceImpl implements PayStackPaymentService {
  final PaystackPlugin plugin = PaystackPlugin();

  FoodYoursPaymentServiceImpl() {
    plugin.initialize(publicKey: Strings.IS_FCM_PERMISSION_REVOKED);
  }

  checkOut(Charge charge) async {
    return await plugin.checkout(
      Get.context!,
      method: CheckoutMethod.card, // Defaults to CheckoutMethod.selectable
      charge: charge,
    );
  }
}
