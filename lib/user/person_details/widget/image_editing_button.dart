import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_yours_customer/resources/Images.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';

class ImageEditButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Function sh = sHeight(context);
    final Function sw = sWidth(context);

    return Container(
      height: sh(16),
      width: sw(16),
      decoration: BoxDecoration(color: FYColors.mainBlue, shape: BoxShape.circle),
      child: Center(child: SvgPicture.asset(Images.pen, height: sh(5.71), width: sw(5.71))),
    );
  }
}
