import 'package:auto_size_text/auto_size_text.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:food_yours_customer/cart/controller/payment_method_screen_controller.dart';
import 'package:food_yours_customer/cart/widget/payment_method_card.dart';
import 'package:food_yours_customer/cart/widget/place_order_button.dart';
import 'package:food_yours_customer/common/widget/secondary_app_bar.dart';
import 'package:food_yours_customer/resources/Images.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';

class PaymentMethodScreen extends StatelessWidget {
  final PaymentMethodScreenController widgetCtrl =
      Get.put(PaymentMethodScreenController());

  @override
  Widget build(BuildContext context) {
    Function sh = sHeight(context);
    Function sw = sWidth(context);

    return Container(
      color: context.theme.backgroundColor,
      child: Scaffold(
        backgroundColor: FYColors.subtleBlack5,
        appBar: PreferredSize(
            preferredSize: Size(sw(20), sh(46.41)),
            child: SecondaryAppBar(title: 'Payment Method')),
        body: ListView(
            padding: EdgeInsets.symmetric(horizontal: sw(24)),
            children: [
              SizedBox(height: sh(25)),
              Row(
                children: [
                  PaymentMethodCard(
                    cardTitle: AutoSizeText("My Wallet",
                        style: context.theme.textTheme.caption!.copyWith(
                            fontSize: sh(Dimens.k16),
                            fontWeight: FontWeight.w700,
                            color: FYColors.darkerBlack2)),
                    cardValueText: TextSpan(
                        style: context.theme.textTheme.headline4!
                            .copyWith(fontSize: sh(Dimens.k12)),
                        text: "Blc: "),
                    cardKeyText: TextSpan(
                      style: context.theme.textTheme.caption!.copyWith(
                          fontSize: sh(Dimens.k12),
                          fontWeight: FontWeight.w800,
                          color: FYColors.mainBlue),
                      text: "N22,500",
                    ),
                  ),
                  SizedBox(width: sw(3)),
                  PaymentMethodCard(
                    cardTitle: AutoSizeText("My Points",
                        style: context.theme.textTheme.caption!.copyWith(
                            fontSize: sh(Dimens.k16),
                            fontWeight: FontWeight.w700,
                            color: FYColors.darkerBlack2)),
                    cardValueText: TextSpan(
                        style: context.theme.textTheme.headline4!
                            .copyWith(fontSize: sh(Dimens.k12)),
                        text: "Pts: "),
                    cardKeyText: TextSpan(
                      style: context.theme.textTheme.caption!.copyWith(
                          fontSize: sh(Dimens.k12),
                          fontWeight: FontWeight.w800,
                          color: FYColors.mainBlue),
                      text: "12",
                    ),
                  ),
                  SizedBox(width: sw(3)),
                  PaymentMethodCard(
                    cardTitle: Center(
                      child: Image.asset(Images.pay_stack,
                          height: sh(25.24), width: sw(25.24)),
                    ),
                    cardValueText: TextSpan(
                        style: context.theme.textTheme.headline4!
                            .copyWith(fontSize: sh(Dimens.k12)),
                        text: "Pts: "),
                    cardKeyText: TextSpan(
                      style: context.theme.textTheme.caption!.copyWith(
                          fontSize: sh(Dimens.k12),
                          fontWeight: FontWeight.w800,
                          color: FYColors.mainBlue),
                      text: "12",
                    ),
                    isImage: true,
                    onTap: widgetCtrl.checkoutWithPaystack,
                  ),
                ],
              ),
              SizedBox(height: sh(41)),
              Container(
                padding: EdgeInsets.symmetric(vertical: sh(26)),
                decoration: BoxDecoration(
                  color: FYColors.subtleBlue3,
                  borderRadius: BorderRadius.circular(Dimens.k12),
                ),
                height: sh(307),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: sw(16)),
                      child: Text(
                        "Amount to Pay",
                        style: context.theme.textTheme.headline4!
                            .copyWith(fontSize: sh(Dimens.k12)),
                      ),
                    ),
                    SizedBox(height: sh(3)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: sw(16)),
                      child: RichText(
                        textAlign: TextAlign.start,
                        text: TextSpan(children: <TextSpan>[
                          TextSpan(
                            style: context.theme.textTheme.caption!.copyWith(
                                fontSize: sh(Dimens.k24),
                                fontWeight: FontWeight.w700,
                                color: FYColors.mainBlue),
                            text: "9,400 ",
                          ),
                          TextSpan(
                            style: context.theme.textTheme.caption!.copyWith(
                                fontSize: sh(Dimens.k12),
                                fontWeight: FontWeight.w400,
                                color: FYColors.mainBlue),
                            text: ".00 N",
                          ),
                        ]),
                      ),
                    ),
                    SizedBox(height: sh(14.0)),
                    DottedLine(
                      direction: Axis.horizontal,
                      lineLength: double.infinity,
                      lineThickness: 0.5,
                      dashLength: 12.0,
                      dashColor: FYColors.subtleBlue4,
                      dashRadius: 0.0,
                      dashGapLength: 2.0,
                      dashGapColor: Colors.transparent,
                      dashGapRadius: 0.0,
                    ),
                    SizedBox(height: sh(28.0)),
                    buildPaymentMethodCardItem(
                        context, "Order from:", "Omowunmi O."),
                    SizedBox(height: sh(24.0)),
                    buildPaymentMethodCardItem(
                        context, "Order ID:", "FD7549Y8"),
                    SizedBox(height: sh(24.0)),
                    buildPaymentMethodCardItem(
                        context, "Order Date:", "29/07/2021   05:22PM"),
                  ],
                ),
              ),
              SizedBox(height: sh(40.0)),
              PlaceOrderButton(widgetCtrl),
              SizedBox(height: sh(16)),
            ]),
      ),
    );
  }

  buildPaymentMethodCardItem(
      BuildContext context, String title, String description) {
    Function sh = sHeight(context);
    Function sw = sWidth(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: sw(16)),
          child: Text(
            title,
            style: context.theme.textTheme.headline4!
                .copyWith(fontSize: sh(Dimens.k12)),
          ),
        ),
        SizedBox(height: sh(3)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: sw(16)),
          child: Text(
            description,
            style: context.theme.textTheme.caption!.copyWith(
                fontSize: sh(12),
                fontWeight: FontWeight.w700,
                color: FYColors.mainBlue),
          ),
        ),
      ],
    );
  }
}
