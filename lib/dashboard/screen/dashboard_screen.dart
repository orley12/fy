import 'package:flutter/material.dart';
import 'package:food_yours_customer/cart/screen/cart_tab.dart';
import 'package:food_yours_customer/dashboard/controller/dashboard_screen_controller.dart';
import 'package:food_yours_customer/dashboard/widget/fy_tab_bar.dart';
import 'package:food_yours_customer/home/screen/home_tab.dart';
import 'package:food_yours_customer/orders/screen/order_tab.dart';
import 'package:food_yours_customer/profile/screen/profile_tab.dart';
import 'package:get/instance_manager.dart';

class DashboardScreen extends StatelessWidget {
  final DashBoardScreenController dashBoardCrtl = Get.put(DashBoardScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(controller: dashBoardCrtl.tabController, children: [
        HomeTab(),
        OrdersTab(),
        CartTab(),
        ProfileTab(),
      ]),
      bottomNavigationBar: FYTabBar(dashBoardCrtl),
    );
  }
}
