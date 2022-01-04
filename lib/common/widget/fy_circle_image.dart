import 'package:flutter/material.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';

class FYCircleImage extends StatelessWidget {
  final Color backgroundColor;
  final double imageRadius;
  final Widget? child;

  const FYCircleImage({
    Key? key,
    required this.imageRadius,
    this.child,
    this.backgroundColor = Colors.transparent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Function sh = sHeight(context);

    return CircleAvatar(
        backgroundColor: backgroundColor,
        radius: sh(imageRadius),
        child:
            child /* image == null
          ? null
          : SvgPicture.asset(
              image!,
              width: double.infinity,
              height: double.infinity,
            ), */
        );
  }
}
