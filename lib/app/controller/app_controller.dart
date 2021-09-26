import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class AppController {
  closeKeyBoard() {
    FocusScopeNode currentFocus = FocusScope.of(Get.context!);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      currentFocus.focusedChild!.unfocus();
    }
  }
}
