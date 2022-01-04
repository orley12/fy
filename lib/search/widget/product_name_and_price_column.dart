// ignore: import_of_legacy_library_into_null_safe
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:food_yours_customer/home/view_model/meal_search_view_model.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class ProductNameAndPriceColumn extends StatelessWidget {
  final MealSearchViewModel mealViewModel;

  const ProductNameAndPriceColumn({
    Key? key,
    required this.mealViewModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Function sh = sHeight(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(
          mealViewModel.name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: context.theme.textTheme.headline1!.copyWith(
            color: FYColors.darkerBlack2,
            fontSize: sh(Dimens.k16),
          ),
        ),
        SizedBox(
          height: sh(Dimens.k8),
        ),
        RichText(
          textAlign: TextAlign.start,
          text: TextSpan(children: <TextSpan>[
            TextSpan(
              style: context.theme.textTheme.headline3!.copyWith(
                color: FYColors.lighterBlack2,
                fontSize: sh(Dimens.k12),
              ),
              text: "From ",
            ),
            TextSpan(
              style: context.theme.textTheme.headline3!
                  .copyWith(fontSize: Dimens.k12),
              text: mealViewModel.lowestPrice,
            ),
          ]),
        ),
      ],
    );
  }
}
