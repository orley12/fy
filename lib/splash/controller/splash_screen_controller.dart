import 'dart:async';

import 'package:food_yours_customer/common/repository/preference_repository.dart';
import 'package:food_yours_customer/login/screen/login_screen.dart';
import 'package:food_yours_customer/resources/enums.dart';
import 'package:food_yours_customer/resources/integers.dart';
import 'package:food_yours_customer/resources/strings.dart';
import 'package:food_yours_customer/util/navigation_util.dart';
import 'package:food_yours_customer/welcome/screen/welcome_screen.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreenController extends GetxController {
  late Timer timer;
  late PreferenceRepository preferenceRepository = Get.find();

  @override
  void onReady() {
    gotoNextScreen();
    super.onReady();
  }

  void gotoNextScreen() {
    timer = Timer(Duration(seconds: Integers.dashBoardTabLength), () {
      if (preferenceRepository.getBooleanPref(Strings.stageOfUSage) == StageOfUsage.REGISTERED.toString()) {
        pushUntil(page: LoginScreen());
      } else {
        pushUntil(page: WelcomeScreen());
      }
    });
  }
}
