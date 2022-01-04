import 'package:flutter/material.dart';
import 'package:food_yours_customer/common/widget/text/mulish_700_text.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';

class FoodYoursChip extends StatelessWidget {
  final String text;

  FoodYoursChip({required this.text});

  @override
  Widget build(BuildContext context) {
    final Function sh = sHeight(context);
    final Function sw = sWidth(context);

    return Container(
      height: sh(Dimens.k18),
      child: Center(
        child: Mulish700Text(
          text: text,
          fontSize: sh(Dimens.k8),
          color: Colors.white,
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: sw(Dimens.k9_5)),
      margin: EdgeInsets.only(right: sw(Dimens.k8)),
      decoration: BoxDecoration(
        color: FYColors.lighterBlack2,
        borderRadius: BorderRadius.circular(Dimens.k50),
      ),
    );
  }
}
