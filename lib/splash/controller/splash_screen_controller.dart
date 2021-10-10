import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_yours_customer/auth/login/screen/login_screen.dart';
import 'package:food_yours_customer/common/repository/preference_repository.dart';
import 'package:food_yours_customer/resources/enums.dart';
import 'package:food_yours_customer/resources/integers.dart';
import 'package:food_yours_customer/resources/strings.dart';
import 'package:food_yours_customer/util/navigation_util.dart';
import 'package:food_yours_customer/welcome/screen/welcome_screen.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:uni_links/uni_links.dart';

class SplashScreenController extends GetxController {
  late Timer timer;
  late PreferenceRepository preferenceRepository = Get.find();
  late StreamSubscription linksStreamSubcription;

  String linkThatOpenedTheApp = "";

  @override
  void onReady(){
    gotoNextScreen();
    checkIfAppWasOpenedViaLink();
    setUpLinkslistenerForWhenAppIsInBackground();
    super.onReady();
  }

  void gotoNextScreen() {
    timer = Timer(Duration(seconds: Integers.dashBoardTabLength), () {
      if(linkThatOpenedTheApp == ""){
        gotoNextScreenWhenAppIsOpenedWithoutLinks();
      } else {
        gotoNextScreenWhenAppIsOpenedWithLinks();
      }
    });
  }

  void gotoNextScreenWhenAppIsOpenedWithLinks() {
    debugPrint(linkThatOpenedTheApp);
    pushUntil(page: LoginScreen());
  }

  void gotoNextScreenWhenAppIsOpenedWithoutLinks() {
    if (preferenceRepository.getBooleanPref(Strings.stageOfUSage) == StageOfUsage.REGISTERED.toString()) {
      pushUntil(page: LoginScreen());
    } else {
      pushUntil(page: WelcomeScreen());
    }
  }

  Future<void> checkIfAppWasOpenedViaLink() async {
    try{
      linkThatOpenedTheApp = await getInitialLink() ?? "";
      debugPrint("WWWWWWWWWWWWWWWWWWWWW${linkThatOpenedTheApp}");
    } on PlatformException {
      debugPrint("unable to getInitialLink");
    }
  }

  void setUpLinkslistenerForWhenAppIsInBackground() {
    Future<void> initUniLinks() async {
      linksStreamSubcription = linkStream.listen((String? link) {
        debugPrint("WWWWWWWWWWWWWWWWWWWWW${link}");
        linkThatOpenedTheApp = link ?? "";
        gotoNextScreenWhenAppIsOpenedWithLinks();
      }, onError: (err) {
        debugPrint("unable to getInitialLink");
      });
    }  
  
  }
}
