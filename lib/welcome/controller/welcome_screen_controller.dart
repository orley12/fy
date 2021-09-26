import 'package:flutter/material.dart';
import 'package:food_yours_customer/login/screen/login_screen.dart';
import 'package:food_yours_customer/registration/screen/registration_screen.dart';
import 'package:food_yours_customer/util/navigation_util.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class WelcomeScreenController extends GetxController with SingleGetTickerProviderMixin {
  var slideOffset = Rx(Offset(1, 0));

  gotoLoginScreen() => push(page: LoginScreen());

  gotoRegistrationScreen() => push(page: RegistrationScreen());

  @override
  void onReady() {
    slideOffset.value -= Offset(1, 0);
    super.onReady();
  }
}
