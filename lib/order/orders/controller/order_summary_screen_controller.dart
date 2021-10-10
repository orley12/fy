import 'dart:async';

import 'package:food_yours_customer/common/widget/notification_widgets.dart';
import 'package:food_yours_customer/order/orders/screen/order_summary_screen.dart';
import 'package:food_yours_customer/order/orders/screen/order_tracking_screen.dart';
import 'package:food_yours_customer/resources/Images.dart';
import 'package:food_yours_customer/resources/integers.dart';
import 'package:food_yours_customer/util/navigation_util.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class OrderSummaryScreenController extends GetxController {
  late Timer timer;

  @override
  void onReady() {
    openAlertDialog();
    super.onReady();
  }

  gotoOrderSummaryScreen() => push(page: OrderSummaryScreen());

  gotoOrderTrackingScreen() => push(page: OrderTrackingScreen());

  openAlertDialog() {
    timer = Timer(
        Duration(seconds: Integers.dashBoardTabLength),
        () => showAlertDialog(
            Images.alert_success_check,
            "You received your order!",
            "Congratulations! You received your orders successfully, enjoy your meal. You can rate a chef based on your experience with your order in the “my orders” page, tap the order to continue.",
            "",
            true));
  }

  gotoChefReviewScreen() {}
}
