import 'package:flutter/material.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';

class CardStrip extends StatelessWidget {
  final Wrap stripeText;
  final double height;

  CardStrip({
    required this.stripeText,
    this.height = Dimens.k22_74,
  });

  @override
  Widget build(BuildContext context) {
    Function sh = sHeight(context);
    Function sw = sWidth(context);

    return Container(
      padding: EdgeInsets.only(right: sw(Dimens.k6_86)),
      height: sh(height),
      child: Align(
        alignment: Alignment.centerLeft,
        child: stripeText,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(Dimens.k50),
          bottomRight: Radius.circular(Dimens.k50),
        ),
      ),
    );
  }
}
