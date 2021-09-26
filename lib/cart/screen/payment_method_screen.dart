import 'package:flutter/material.dart';
import 'package:food_yours_customer/cart/widget/payment_method_card.dart';
import 'package:food_yours_customer/common/widget/secondary_app_bar.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:get/instance_manager.dart';

class PaymentMethodScreen extends StatelessWidget {
  final PaymentMethodScreenController widgetCtrl = Get.put(PaymentMethodScreenController());

  @override
  Widget build(BuildContext context) {
    Function sh = sHeight(context);
    Function sw = sWidth(context);

    return Container(
      color: context.theme.backgroundColor,
      child: Scaffold(
        backgroundColor: FYColors.subtleBlack5,
        appBar: PreferredSize(preferredSize: Size(sw(20), sh(46.41)), child: SecondaryAppBar(title: 'Payment Method')),
        body: ListView(padding: EdgeInsets.symmetric(horizontal: sw(24)), children: [
          Container(
            height: sh(74),
            child: ListView.builder(
                itemCount: 3,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) => PaymentMethodCard()),
          ),
          SizedBox(height: sh(51)),
          Container(
            padding: EdgeInsets.symmetric(horizontal: sw(16)),
            decoration: BoxDecoration(
              color: FYColors.subtleBlue3,
              borderRadius: BorderRadius.circular(Dimens.k12),
            ),
            height: sh(293),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Amount to Pay",
                  style: context.theme.textTheme.headline4!.copyWith(fontSize: sh(Dimens.k12)),
                ),
                SizedBox(height: sh(3)),
                RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(children: <TextSpan>[
                    TextSpan(
                      style: context.theme.textTheme.caption!
                          .copyWith(fontSize: sh(Dimens.k24), fontWeight: FontWeight.w700, color: FYColors.mainBlue),
                      text: "9,400 ",
                    ),
                    TextSpan(
                      style: context.theme.textTheme.caption!
                          .copyWith(fontSize: sh(Dimens.k12), fontWeight: FontWeight.w400, color: FYColors.mainBlue),
                      text: ".00 N",
                    ),
                  ]),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

class PaymentMethodScreenController extends GetxController {}
