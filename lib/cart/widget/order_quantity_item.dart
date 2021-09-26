import 'package:flutter/material.dart';
import 'package:food_yours_customer/cart/widget/cart_order_quantity_control.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class OrderQuantityItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Function sh = sHeight(context);
    Function sw = sWidth(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Ofada Rice",
                style: context.theme.textTheme.caption!
                    .copyWith(fontSize: sh(Dimens.k16), fontWeight: FontWeight.w600, color: FYColors.darkerBlack2)),
            SizedBox(height: sh(12)),
            RichText(
              textAlign: TextAlign.start,
              text: TextSpan(children: <TextSpan>[
                TextSpan(
                  style: context.theme.textTheme.headline3!.copyWith(fontSize: sh(Dimens.k16)),
                  text: "N3,200 ",
                ),
                TextSpan(
                  style: context.theme.textTheme.caption!.copyWith(fontSize: sh(Dimens.k12)),
                  text: "N3,200/minimum",
                ),
              ]),
            ),
          ],
        ),
        CartOrderQuantityControl(),
      ],
    );
  }
}
