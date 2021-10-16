import 'package:flutter/material.dart';
import 'package:food_yours_customer/auth/service/auth_service.dart';
import 'package:food_yours_customer/dashboard/view_model/tab_info.dart';
import 'package:food_yours_customer/resources/integers.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:get/instance_manager.dart';

class DashBoardScreenController extends GetxController with SingleGetTickerProviderMixin {
  final AuthService authService = Get.find();

  RxString loadingMessage = "".obs;
  RxBool isLoading = false.obs;

  RxInt currentTabIndex = 0.obs;

  late TabController tabController = TabController(length: Integers.dashBoardTabLength, vsync: this)
    ..addListener(() => currentTabIndex.value = tabController.index);

  late List<Map> tabDataList = TabInfoViewModel.getList();
}
