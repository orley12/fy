import 'package:flutter/material.dart';
import 'package:food_yours_customer/common/service/fcm_service.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';

class AppController extends GetxController {
  closeKeyBoard() {
    FocusScopeNode currentFocus = FocusScope.of(Get.context!);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      currentFocus.focusedChild!.unfocus();
    }
  }

  @override
  void onInit() {
    FCMService()
      ..requestPermission()
      ..getFcmToken()
      ..registerNotification();
    super.onInit();
  }
}
