import 'package:flutter/material.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/resources/icons.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class Rating extends StatelessWidget {
  double ratings;

  Rating(this.ratings);

  @override
  Widget build(BuildContext context) {
    Function sh = sHeight(context);
    Function sw = sWidth(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          FYIcons.star,
          size: Dimens.k14,
          color: context.theme.textTheme.button!.color,
        ),
        Text(ratings.toString(), style: context.theme.textTheme.button!.copyWith(fontWeight: FontWeight.w600, fontSize: sh(9.85)))
      ],
    );
  }
}
