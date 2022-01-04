import 'package:flutter/material.dart';
import 'package:food_yours_customer/common/widget/text/mulish_600_text.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/resources/icons.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';

class Rating extends StatelessWidget {
  final double ratings;

  Rating(this.ratings);

  @override
  Widget build(BuildContext context) {
    Function sh = sHeight(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          FYIcons.star,
          size: Dimens.k14,
          color: Colors.white,
        ),
        Mulish600Text(
          text: ratings.toString(),
          color: Colors.white,
          fontSize: sh(9.85),
        )
      ],
    );
  }
}
