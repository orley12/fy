import 'package:flutter/material.dart';
import 'package:food_yours_customer/cart/interface/interface_cart_order.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class PlaceOrderButton extends StatelessWidget {
  final ICartOrder widgetCtrl;

  PlaceOrderButton(this.widgetCtrl);

  @override
  Widget build(BuildContext context) {
    Function sh = sHeight(context);
    Function sw = sWidth(context);

    return TextButton(
      onPressed: widgetCtrl.placeOrder,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: sw(24)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Pay N9,400",
              style: context.theme.textTheme.button!.copyWith(fontSize: sh(Dimens.k16), fontWeight: FontWeight.w800),
            ),
            Icon(Icons.arrow_forward_ios, color: Colors.white, size: sh(12))
          ],
        ),
      ),
    );
  }
}
