import 'package:flutter/material.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';

class FYIconButton extends StatelessWidget {
  final IconData icon;
  final Function()? onPressed;
  final Color color;
  final double iconSize;
  final double splashRadius;
  final EdgeInsetsGeometry padding;

  const FYIconButton({
    Key? key,
    required this.icon,
    this.onPressed,
    this.color = FYColors.lighterBlack2,
    this.iconSize = Dimens.k24,
    this.splashRadius = Dimens.k20,
    this.padding = const EdgeInsets.all(8.0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Function sh = sHeight(context);

    return IconButton(
      padding: padding,
      constraints: const BoxConstraints(),
      icon: Icon(
        icon,
        size: sh(iconSize),
        color: color,
      ),
      splashRadius: sh(splashRadius),
      onPressed: onPressed,
    );
  }
}
