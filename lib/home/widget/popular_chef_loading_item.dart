import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:food_yours_customer/resources/Images.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:shimmer/shimmer.dart';

class PopularChefLoadingItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Function sh = sHeight(context);

    return Shimmer.fromColors(
      child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Container(
              height: sh(141.18),
              width: sh(142),
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
