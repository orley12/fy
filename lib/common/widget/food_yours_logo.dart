import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_utils/get_utils.dart';

class FYLogo extends StatelessWidget {
  final String svgPath;
  final double? height;
  final double? width;

  const FYLogo({this.height, this.width, required this.svgPath});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      svgPath,
      color: context.theme.backgroundColor,
      height: height,
      width: width,
    );
  }
}
