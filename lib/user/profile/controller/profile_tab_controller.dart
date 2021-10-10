import 'package:flutter/material.dart';
import 'package:food_yours_customer/common/widget/fy_switch.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/icons.dart';
import 'package:food_yours_customer/util/navigation_util.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get.dart';

class ProfileTabController extends GetxController {
  RxBool enableNotification = false.obs;

  onOptionSelected(Widget page) => push(page: page);

  void toggleNotification(bool value) => enableNotification.value = value;
}
