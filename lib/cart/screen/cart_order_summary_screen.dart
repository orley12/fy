import 'package:flutter/material.dart';
import 'package:food_yours_customer/cart/controller/cart_order_summary_controlller.dart';
import 'package:food_yours_customer/cart/widget/order_quantity_item.dart';
import 'package:food_yours_customer/common/widget/app_button.dart';
import 'package:food_yours_customer/common/widget/secondary_app_bar.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:get/instance_manager.dart';

class CartOrderSummaryScreen extends StatelessWidget {
  final CartOrderSummaryScreenController widgetCtrl = Get.put(CartOrderSummaryScreenController());

  @override
  Widget build(BuildContext context) {
    Function sh = sHeight(context);
    Function sw = sWidth(context);

    return Container(
      color: context.theme.backgroundColor,
      child: Scaffold(
        backgroundColor: FYColors.subtleBlack5,
        appBar: PreferredSize(preferredSize: Size(sw(20), sh(46.41)), child: SecondaryAppBar(title: 'Order Summary')),
        body: ListView(children: [
          SizedBox(height: sh(24)),
          buildFoodItemsSection(sw, context, sh),
          SizedBox(height: sh(23)),
          buildDeliveryDetailsSection(sw, context, sh),
          SizedBox(height: sh(19)),
          buildOrderAggregationSection(sw, sh, context)
        ]),
      ),
    );
  }

  Container buildOrderAggregationSection(Function sw, Function sh, BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: sw(24), vertical: sh(16)),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Subtotal",
                style: context.theme.textTheme.headline4!.copyWith(fontSize: sh(Dimens.k16)),
              ),
              Text(
                "N8,400",
                style: context.theme.textTheme.headline4!.copyWith(fontSize: sh(Dimens.k16)),
              )
            ],
          ),
          SizedBox(height: sh(8)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Delivery fee",
                style: context.theme.textTheme.headline4!.copyWith(fontSize: sh(Dimens.k16)),
              ),
              Text(
                "N1,000",
                style: context.theme.textTheme.headline4!.copyWith(fontSize: sh(Dimens.k16)),
              )
            ],
          ),
          SizedBox(height: sh(12)),
          Divider(height: 0, thickness: 0.5),
          SizedBox(height: sh(9)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total",
                style: context.theme.textTheme.headline4!.copyWith(fontSize: sh(Dimens.k14)),
              ),
              Text(
                "N9,400",
                style: context.theme.textTheme.headline3!.copyWith(fontSize: sh(Dimens.k16)),
              )
            ],
          ),
          SizedBox(height: sh(27)),
          TextButton(
            onPressed: widgetCtrl.gotoPaymentMethodScreen,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: sw(24)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Pay N9,400",
                    style: context.theme.textTheme.button!.copyWith(fontSize: sh(Dimens.k16), fontWeight: FontWeight.w800),
                  ),
                  Icon(Icons.arrow_forward_ios, color: Colors.white, size: sh(12))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Column buildFoodItemsSection(Function sw, BuildContext context, Function sh) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: sw(24)),
          child: Text("Food Items",
              style: context.theme.textTheme.caption!
                  .copyWith(fontSize: Dimens.k16, fontWeight: FontWeight.w600, color: FYColors.darkerBlack2)),
        ),
        SizedBox(height: sh(8)),
        Container(
          height: sh(280),
          color: Colors.white,
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: sw(24)),
          child: Column(
            children: [
              SizedBox(height: sh(27)),
              ListView.separated(
                padding: EdgeInsets.zero,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) => OrderQuantityItem(),
                separatorBuilder: (BuildContext context, int index) => Divider(),
                itemCount: 3,
              ),
              Divider(),
            ],
          ),
        ),
      ],
    );
  }

  Column buildDeliveryDetailsSection(Function sw, BuildContext context, Function sh) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: sw(24)),
          child: Text("Delivery Details",
              style: context.theme.textTheme.caption!
                  .copyWith(fontSize: Dimens.k16, fontWeight: FontWeight.w600, color: FYColors.darkerBlack2)),
        ),
        SizedBox(height: sh(8)),
        Container(
          color: Colors.white,
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: sw(24), vertical: sh(12)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Address",
                    style: context.theme.textTheme.caption!.copyWith(fontSize: sh(Dimens.k12)),
                  ),
                  SizedBox(height: sh(45)),
                  Text(
                    "Contact:",
                    style: context.theme.textTheme.caption!.copyWith(fontSize: sh(Dimens.k12)),
                  ),
                  SizedBox(height: sh(4)),
                  Text(
                    "Date & Time:",
                    style: context.theme.textTheme.caption!.copyWith(fontSize: sh(Dimens.k12)),
                  ),
                ],
              ),
              SizedBox(width: sw(48)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("23 Barnawa, Kaduna Nigeria.",
                      style: context.theme.textTheme.caption!
                          .copyWith(fontSize: sh(Dimens.k12), fontWeight: FontWeight.w400, color: FYColors.darkerBlack2)),
                  SizedBox(height: sh(15)),
                  FYButton(
                    onTap: () {},
                    child: Text("Tap to Change",
                        style: context.theme.textTheme.headline3!.copyWith(color: FYColors.mainBlue, fontSize: sh(12))),
                  ),
                  SizedBox(height: sh(15)),
                  Text("+234 703 248 8573",
                      style: context.theme.textTheme.caption!
                          .copyWith(fontSize: sh(Dimens.k12), fontWeight: FontWeight.w400, color: FYColors.darkerBlack2)),
                  SizedBox(height: sh(4)),
                  Text("22/08/2021",
                      style: context.theme.textTheme.caption!
                          .copyWith(fontSize: sh(Dimens.k12), fontWeight: FontWeight.w400, color: FYColors.darkerBlack2)),
                  SizedBox(height: sh(10)),
                  FYButton(
                    onTap: () {},
                    child: Text("Tap to Edit",
                        style: context.theme.textTheme.headline3!.copyWith(color: FYColors.mainBlue, fontSize: sh(12))),
                  )
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
