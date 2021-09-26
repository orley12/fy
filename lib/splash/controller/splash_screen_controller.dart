import 'dart:async';

import 'package:food_yours_customer/resources/integers.dart';
import 'package:food_yours_customer/util/navigation_util.dart';
import 'package:food_yours_customer/welcome/screen/welcome_screen.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class SplashScreenController extends GetxController {
  late Timer timer;

  @override
  void onReady() {
    gotoNextScreen();
    super.onReady();
  }

  void gotoNextScreen() {
    timer = Timer(Duration(seconds: Integers.dashBoardTabLength), () => push(page: WelcomeScreen()));
  }
}
