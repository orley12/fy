import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:food_yours_customer/common/widget/local_theme.dart';
import 'package:food_yours_customer/common/widget/text_button.dart';
import 'package:food_yours_customer/home/controller/home_tab_front_panel_controller.dart';
import 'package:food_yours_customer/resources/Images.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:get/instance_manager.dart';
import 'package:shimmer/shimmer.dart';

class LargeOrderBanner extends StatelessWidget {
  final HomeTabFrontPanelController widgetCtrl =
      Get.put(HomeTabFrontPanelController());

  @override
  Widget build(BuildContext context) {
    Function sh = sHeight(context);
    Function sw = sWidth(context);

    return Container(
      height: sh(220),
      margin: EdgeInsets.symmetric(horizontal: sw(Dimens.k24)),
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Images.large_order_banner),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.75), BlendMode.darken),
          ),
          borderRadius: BorderRadius.circular(9.85)),
      child: Column(
        children: [
          SizedBox(height: sh(Dimens.k24)),
          Text("Do you have an event \ncoming up?",
              textAlign: TextAlign.center,
              style: context.theme.textTheme.button!.copyWith(
                fontWeight: FontWeight.w700,
                fontSize: sh(19),
              )),
          SizedBox(height: sh(Dimens.k16)),
          Text("You can order for your food and pastries here",
              textAlign: TextAlign.center,
              style: context.theme.textTheme.button!.copyWith(
                fontSize: sh(Dimens.k12),
              )),
          SizedBox(height: sh(Dimens.k32)),
          Center(
            child: LocalTheme(
              child: FYTextButton(
                  text: "Order Now",
                  onPressed: widgetCtrl.gotoLargeOrderScreen,
                  fontSize: Dimens.k16),
              // buttonStyle: whiteTextButtonStyle.copyWith(
              //   minimumSize: MaterialStateProperty.all<Size>(Size(Dimens.k136, Dimens.k47)),
              // ),
              buttonTextStyle: context.theme.textTheme.headline3!
                  .copyWith(fontWeight: FontWeight.w400),
            ),
          ),
        ],
      ),
    );
  }
}

class LargeOrderBannerLoadingItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Function sh = sHeight(context);
    final Function sw = sWidth(context);

    return Shimmer.fromColors(
      child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Container(
              width: double.infinity,
              height: sh(220),
              margin: EdgeInsets.symmetric(horizontal: sw(Dimens.k24)),
              decoration: BoxDecoration(
                color: Color(0xffeaf0f0),
                borderRadius: BorderRadius.circular(Dimens.k4),
                image: DecorationImage(
                    image: AssetImage(Images.food_category), fit: BoxFit.fill),
              ))),
      baseColor: Color(0xffeaf0f0),
      highlightColor: Colors.white,
    );
  }
}
