import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class FoodCategoryLabel extends StatelessWidget {
  final String labelText;

  FoodCategoryLabel(this.labelText);

  @override
  Widget build(BuildContext context) {
    Function sh = sHeight(context);
    Function sw = sWidth(context);

    return Container(
      child: Center(
        child: AutoSizeText(
          labelText,
          minFontSize: 8,
          style: context.theme.textTheme.headline3!.copyWith(fontSize: sh(9.85)),
        ),
      ),
      height: sh(16.42),
      width: sw(46.79),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topRight: Radius.circular(Dimens.k50), bottomRight: Radius.circular(Dimens.k50))),
    );
  }
}
