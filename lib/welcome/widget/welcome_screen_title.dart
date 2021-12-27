import 'package:flutter/material.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class WelcomeScreenTitle extends StatelessWidget {
  const WelcomeScreenTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Function sh = sHeight(context);

    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(children: <TextSpan>[
        TextSpan(
          style: context.theme.textTheme.headline1!
              .copyWith(fontSize: sh(Dimens.k24)),
          text: "Discover and order \n quality ",
        ),
        TextSpan(
          style: context.theme.textTheme.headline1!
              .copyWith(fontSize: sh(Dimens.k24), color: FYColors.mainRed),
          text: "homemade ",
        ),
        TextSpan(
          style: context.theme.textTheme.headline1!
              .copyWith(fontSize: sh(Dimens.k24)),
          text: "meals",
        ),
      ]),
    );
  }
}
