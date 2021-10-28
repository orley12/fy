import 'package:flutter/material.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:food_yours_customer/cart/interface/interface_cart_order.dart';
import 'package:food_yours_customer/cart/screen/delivery_time_screen.dart';
import 'package:food_yours_customer/cart/service/food_yours_payment_service/food_yours_payment_service.dart';
import 'package:food_yours_customer/cart/service/paystack_payment_service/paystack_payment_service.dart';
import 'package:food_yours_customer/util/navigation_util.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';

class PaymentMethodScreenController extends GetxController
    implements ICartOrder {
  final PayStackPaymentService payStackPaymentService = Get.find();
  final FoodYoursPaymentService foodYoursPaymentService = Get.find();

  RxList<Widget> paymentMethods = <Widget>[].obs;

  @override
  placeOrder() {
    push(page: DeliveryTimeScreen());
  }

  checkoutWithPaystack() {
    Charge charge = Charge()
      ..amount = 10000
      ..reference = "qwertyuio" /* _getReference() */
      // or ..accessCode = _getAccessCodeFrmInitialization()
      ..email = 'customer@email.com';
    payStackPaymentService.checkOut(charge);
  }

  initiatePayStackPayment() async {
    foodYoursPaymentService.initiatePayStackPayment();
  }
}
