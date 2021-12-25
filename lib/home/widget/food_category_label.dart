import 'package:flutter/material.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';

class CardStrip extends StatelessWidget {
  final Widget stripeText;

  CardStrip(this.stripeText);

  @override
  Widget build(BuildContext context) {
    Function sh = sHeight(context);
    Function sw = sWidth(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            child: Align(
              alignment: Alignment.centerLeft,
              child: stripeText,
            ),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(Dimens.k50),
                    bottomRight: Radius.circular(Dimens.k50))),
          ),
        ),
      ],
    );
  }
}
