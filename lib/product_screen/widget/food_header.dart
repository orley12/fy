import 'package:flutter/material.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class FoodTableHeader extends StatelessWidget {
  final String trailing;
  final String leading;
  final bool hideAsterisk;

  FoodTableHeader(
      {this.leading = "", this.trailing = "", this.hideAsterisk = true});

  @override
  Widget build(BuildContext context) {
    final Function sh = sHeight(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RichText(
          text: TextSpan(children: <TextSpan>[
            TextSpan(
              style: context.theme.textTheme.headline1!.copyWith(
                color: FYColors.darkerBlack2,
                fontSize: sh(Dimens.k16),
              ),
              text: leading,
            ),
            TextSpan(
              style: context.theme.textTheme.headline3!
                  .copyWith(fontSize: sh(Dimens.k16)),
              text: hideAsterisk ? "*" : "",
            ),
          ]),
        ),
        Text(
          trailing,
          style: context.theme.textTheme.headline3!.copyWith(
            color: FYColors.lighterBlack2,
            fontSize: sh(Dimens.k12),
          ),
        )
      ],
    );
  }
}
