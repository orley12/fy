import 'package:flutter/material.dart';
// import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';

class BrassIconButton extends StatelessWidget {
  final IconData icon;
  final Function()? onPressed;
  // final Color color;

  const BrassIconButton({
    Key? key,
    required this.icon,
    this.onPressed,
    // this.color = FYColors.subtleBlack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Function sh = sHeight(context);

    return IconButton(
      icon: Icon(
        icon,
        size: sh(Dimens.k24),
        // color: color,
      ),
      splashRadius: sh(Dimens.k20),
      onPressed: onPressed,
    );
  }
}
