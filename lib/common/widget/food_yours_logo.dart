import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';

class FYLogo extends StatelessWidget {
  final String svgPath;
  final double height;
  final double width;
  final Color color;

  const FYLogo({
    this.height = Dimens.k33_9,
    this.width = Dimens.k165,
    required this.svgPath,
    this.color = FYColors.mainRed,
  });

  @override
  Widget build(BuildContext context) {
    Function sh = sHeight(context);
    Function sw = sWidth(context);

    return SvgPicture.asset(
      svgPath,
      color: color,
      height: sh(33.9),
      width: sw(165),
    );
  }
}
