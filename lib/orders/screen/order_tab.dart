import 'package:flutter/material.dart';
import 'package:food_yours_customer/common/widget/primary_app_bar.dart';
import 'package:food_yours_customer/orders/controller/orders_tab_controller.dart';
import 'package:food_yours_customer/orders/widget/order_card.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:get/instance_manager.dart';

class OrdersTab extends StatelessWidget {
  final OrdersTabController widgetCtrl = Get.put(OrdersTabController());

  @override
  Widget build(BuildContext context) {
    Function sh = sHeight(context);
    Function sw = sWidth(context);

    return Container(
      color: context.theme.backgroundColor,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: FYColors.subtleBlack5,
          appBar: PreferredSize(preferredSize: Size(20, sh(46.41)), child: PrimaryAppBar(title: "My Orders")),
          body: Container(
            padding: EdgeInsets.symmetric(horizontal: sw(Dimens.k24), vertical: sh(Dimens.k16)),
            child: ListView(
              children: [
                Text("Ongoing Order", style: context.theme.textTheme.headline2!.copyWith(fontSize: sh(Dimens.k16))),
                SizedBox(height: sh(Dimens.k8)),
                ListView.separated(
                  padding: EdgeInsets.zero,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) => OrderCard(),
                  separatorBuilder: (BuildContext context, int index) => SizedBox(height: sh(Dimens.k24)),
                  itemCount: 1,
                ),
                SizedBox(height: sh(24)),
                Text("Order History", style: context.theme.textTheme.headline2!.copyWith(fontSize: sh(Dimens.k16))),
                Text("Re-order your favourite meals here",
                    style: context.theme.textTheme.caption!.copyWith(fontSize: Dimens.k12)),
                SizedBox(height: sh(8)),
                ListView.separated(
                  padding: EdgeInsets.zero,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) => OrderCard(),
                  separatorBuilder: (BuildContext context, int index) => SizedBox(height: sh(Dimens.k24)),
                  itemCount: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
