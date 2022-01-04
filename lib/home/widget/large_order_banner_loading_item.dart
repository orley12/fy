import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:food_yours_customer/resources/Images.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:shimmer/shimmer.dart';

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
