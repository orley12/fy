import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class CardStripe extends StatelessWidget {
  final Widget stripeText;

  CardStripe(this.stripeText);

  @override
  Widget build(BuildContext context) {
    Function sh = sHeight(context);
    Function sw = sWidth(context);

    return Expanded(
      child: Container(
        child: Center(
          child: stripeText,
        ),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(topRight: Radius.circular(Dimens.k50), bottomRight: Radius.circular(Dimens.k50))),
      ),
    );
  }
}
