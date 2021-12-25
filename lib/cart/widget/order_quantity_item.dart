import 'package:flutter/material.dart';
import 'package:food_yours_customer/cart/model/cart_model.dart';
import 'package:food_yours_customer/cart/widget/cart_order_quantity_control.dart';
import 'package:food_yours_customer/common/widget/app_button.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class OrderQuantityItem extends StatelessWidget {
  final Function onCartItemSelected;
  final CartModel cartItem;
  final int indexOfCartItem;
  final Function increaseItemQuantity;
  final Function decreaseItemQuantity;

  OrderQuantityItem({
    required this.cartItem,
    required this.indexOfCartItem,
    required this.increaseItemQuantity,
    required this.decreaseItemQuantity,
    required this.onCartItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    Function sh = sHeight(context);
    Function sw = sWidth(context);

    return FYButton(
      onTap: () => onCartItemSelected(cartItem),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(cartItem.mealName,
                  style: context.theme.textTheme.caption!.copyWith(
                      fontSize: sh(Dimens.k16),
                      fontWeight: FontWeight.w600,
                      color: FYColors.darkerBlack2)),
              SizedBox(height: sh(12)),
              RichText(
                textAlign: TextAlign.start,
                text: TextSpan(children: <TextSpan>[
                  TextSpan(
                    style: context.theme.textTheme.headline3!
                        .copyWith(fontSize: sh(Dimens.k16)),
                    text: cartItem.total.toString(),
                  ),
                  TextSpan(
                    style: context.theme.textTheme.caption!
                        .copyWith(fontSize: sh(Dimens.k12)),
                    text: " N${cartItem.minimumMealPrice}/minimum",
                  ),
                ]),
              ),
            ],
          ),
          CartOrderQuantityControl(cartItem, indexOfCartItem,
              increaseItemQuantity, decreaseItemQuantity),
        ],
      ),
    );
  }
}
