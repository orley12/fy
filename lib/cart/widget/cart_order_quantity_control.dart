import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:food_yours_customer/common/widget/app_button.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class CartOrderQuantityControl extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Function sh = sHeight(context);
    Function sw = sWidth(context);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: sw(8.3), vertical: sh(3.33)),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(2), border: Border.all(color: FYColors.lighterBlack2)),
      child: Column(
        children: [
          FYButton(
            onTap: () {},
            child: Icon(Icons.add, size: sh(12)),
          ),
          SizedBox(height: sh(5.33)),
          Text("2",
              style: context.theme.textTheme.caption!
                  .copyWith(fontSize: sh(Dimens.k12), fontWeight: FontWeight.w600, color: FYColors.darkerBlack2)),
          SizedBox(height: sh(5.33)),
          FYButton(
            onTap: () {},
            child: Icon(Feather.minus, size: sh(12)),
          )
        ],
      ),
    );
  }
}
