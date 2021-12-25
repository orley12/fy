import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_icons/flutter_icons.dart';
import 'package:food_yours_customer/cart/model/cart_model.dart';
import 'package:food_yours_customer/common/widget/app_button.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class CartOrderQuantityControl extends StatelessWidget {
  final CartModel cartItem;
  final int indexOfCartItem;
  final Function increaseQuantity;
  final Function decreaseQuantity;

  CartOrderQuantityControl(this.cartItem, this.indexOfCartItem,
      this.increaseQuantity, this.decreaseQuantity);

  @override
  Widget build(BuildContext context) {
    Function sh = sHeight(context);
    Function sw = sWidth(context);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: sw(8.3), vertical: sh(3.33)),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          border: Border.all(color: FYColors.lighterBlack2)),
      child: Column(
        children: [
          FYButton(
            onTap: () => increaseQuantity(cartItem.id),
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.add, size: sh(12)),
            ),
          ),
          SizedBox(height: sh(5.33)),
          Text("${cartItem.count}",
              style: context.theme.textTheme.caption!.copyWith(
                  fontSize: sh(Dimens.k12),
                  fontWeight: FontWeight.w600,
                  color: FYColors.darkerBlack2)),
          SizedBox(height: sh(5.33)),
          FYButton(
            onTap: () => decreaseQuantity(cartItem.id),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Feather.minus, size: sh(12)),
            ),
          )
        ],
      ),
    );
  }
}
