import 'package:flutter/material.dart';
import 'package:food_yours_customer/common/widget/app_bar/primary_app_bar.dart';
import 'package:food_yours_customer/order/orders/controller/orders_tab_controller.dart';
import 'package:food_yours_customer/order/orders/widget/order_card.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/resources/strings.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:get/instance_manager.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

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
          appBar: PreferredSize(
              preferredSize: Size(20, sh(46.41)),
              child: PrimaryAppBar(title: "My Orders")),
          body: Container(
            padding: EdgeInsets.symmetric(
                horizontal: sw(Dimens.k24), vertical: sh(Dimens.k16)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Ongoing Order",
                    style: context.theme.textTheme.headline2!.copyWith(
                        fontSize: sh(Dimens.k16), color: FYColors.mainBlue)),
                SizedBox(height: sh(Dimens.k8)),
                Expanded(
                  flex: 30,
                  child: ValueListenableBuilder<Box>(
                      valueListenable: Hive.box(Strings.CART_BOX).listenable(),
                      builder: (context, box, _) {
                        return ListView.separated(
                          padding: EdgeInsets.zero,
                          itemBuilder: (BuildContext context, int index) =>
                              OrderCard(box.getAt(index)),
                          separatorBuilder: (BuildContext context, int index) =>
                              SizedBox(height: sh(Dimens.k24)),
                          itemCount: box.values.length,
                        );
                      }),
                ),
                SizedBox(height: sh(24)),
                Text("Order History",
                    style: context.theme.textTheme.headline2!
                        .copyWith(fontSize: sh(Dimens.k16))),
                Text("Re-order your favourite meals here",
                    style: context.theme.textTheme.caption!
                        .copyWith(fontSize: Dimens.k12)),
                SizedBox(height: sh(8)),
                Expanded(
                  flex: 70,
                  child: ValueListenableBuilder<Box>(
                      valueListenable: Hive.box(Strings.CART_BOX).listenable(),
                      builder: (context, box, _) {
                        return ListView.separated(
                          padding: EdgeInsets.zero,
                          itemBuilder: (BuildContext context, int index) =>
                              OrderCard(box.getAt(index)),
                          separatorBuilder: (BuildContext context, int index) =>
                              SizedBox(height: sh(Dimens.k24)),
                          itemCount: box.values.length,
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
