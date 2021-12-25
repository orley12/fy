// ignore: import_of_legacy_library_into_null_safe
import 'package:auto_size_text/auto_size_text.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:food_yours_customer/cart/controller/payment_method_screen_controller.dart';
import 'package:food_yours_customer/cart/widget/payment_method_card.dart';
import 'package:food_yours_customer/cart/widget/place_order_button.dart';
import 'package:food_yours_customer/common/view_model/global_objects.dart';
import 'package:food_yours_customer/common/widget/secondary_app_bar.dart';
import 'package:food_yours_customer/resources/Images.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/resources/enums.dart';
import 'package:food_yours_customer/util/date_time_util.dart';
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
                  Obx(
                    () => PaymentMethodCard(
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
                      onTap: () => widgetCtrl
                          .onSelectPaymentMethod(PaymentMethod.WALLET),
                      isSelected: widgetCtrl.paymentMethod.value ==
                          PaymentMethod.WALLET,
                    ),
                  ),
                  SizedBox(width: sw(3)),
                  Obx(
                    () => PaymentMethodCard(
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
                      onTap: () => widgetCtrl
                          .onSelectPaymentMethod(PaymentMethod.POINTS),
                      isSelected: widgetCtrl.paymentMethod.value ==
                          PaymentMethod.POINTS,
                    ),
                  ),
                  SizedBox(width: sw(3)),
                  Obx(
                    () => PaymentMethodCard(
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
                      onTap: () => widgetCtrl
                          .onSelectPaymentMethod(PaymentMethod.PAYSTACK),
                      isSelected: widgetCtrl.paymentMethod.value ==
                          PaymentMethod.PAYSTACK,
                    ),
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
                      child: Obx(
                        () => RichText(
                          textAlign: TextAlign.start,
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                style: context.theme.textTheme.caption!
                                    .copyWith(
                                        fontSize: sh(Dimens.k24),
                                        fontWeight: FontWeight.w700,
                                        color: FYColors.mainBlue),
                                text:
                                    "${widgetCtrl.total.value.substring(0, widgetCtrl.total.value.indexOf("."))}",
                              ),
                              TextSpan(
                                style: context.theme.textTheme.caption!
                                    .copyWith(
                                        fontSize: sh(Dimens.k12),
                                        fontWeight: FontWeight.w400,
                                        color: FYColors.mainBlue),
                                text:
                                    "${widgetCtrl.total.value.substring(widgetCtrl.total.value.indexOf("."))} N",
                              ),
                            ],
                          ),
                        ),
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
                    Obx(
                      () => buildPaymentMethodCardItem(context, "Order from:",
                          "${user.value.firstName} ${user.value.lastName.substring(0, 1)}"),
                    ),
                    SizedBox(height: sh(24.0)),
                    Obx(
                      () => buildPaymentMethodCardItem(
                          context, "Order ID:", widgetCtrl.orderId.value),
                    ),
                    SizedBox(height: sh(24.0)),
                    Obx(
                      () => buildPaymentMethodCardItem(context, "Order Date:",
                          widgetCtrl.deliveryDate.value),
                    ),
                  ],
                ),
              ),
              SizedBox(height: sh(40.0)),
              Obx(
                () => PlaceOrderButton(widgetCtrl.placeOrder,
                    double.parse(widgetCtrl.total.value)),
              ),
              SizedBox(height: sh(16)),
            ]),
      ),
    );
  }

  Widget buildPaymentMethodCardItem(
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
