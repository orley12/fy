import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

push({required Widget page, dynamic arguments}) {
  Get.to(page, arguments: arguments);
}

pushUntil({required Widget page}) {
  Get.offAll(page);
}

pushReplacement({required Widget page}) {
  Get.off(page);
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
