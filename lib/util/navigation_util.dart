import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:get/route_manager.dart';

push({required Widget page, dynamic arguments}) {
  Get.to(() => page, arguments: arguments);
}

pushUntil({required Widget page, dynamic arguments}) {
  Get.offAll(() => page, arguments: arguments);
}

pushReplacement({required Widget page, dynamic arguments}) {
  Get.off(() => page, arguments: arguments);
}

pop() {
  Get.back();
}

enum RouteTransitionCallback { didPush, didPopNext, didPop, didPushNext }

tabPop({required TabController controller}) {
  controller.animateTo((controller.index - 1) % controller.length);
}

tabPush({required TabController controller}) {
  controller.animateTo((controller.index + 1) % controller.length);
}
