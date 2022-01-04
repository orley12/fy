import 'package:flutter/material.dart';
import 'package:food_yours_customer/common/widget/text/mulish_400_text.dart';
import 'package:food_yours_customer/common/widget/text/mulish_700_text.dart';
import 'package:food_yours_customer/home/view_model/meal_view_model.dart';
import 'package:food_yours_customer/home/widget/food_yours_chip.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';

class ProductTitle extends StatelessWidget {
  final MealViewModel meal;

  const ProductTitle({
    Key? key,
    required this.meal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Function sh = sHeight(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Mulish700Text(
              text: meal.name,
              fontSize: sh(Dimens.k16),
            ),
            SizedBox(
              height: sh(Dimens.k10),
            ),
            Wrap(
              children: List.generate(
                meal.tags.length,
                (index) => FoodYoursChip(
                  text: meal.tags[index],
                ),
              ),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Mulish400Text(
              text: "Order Amount",
              fontSize: sh(Dimens.k12),
            ),
            Mulish700Text(
              text: "\u{020A6}"
                  " ${meal.allPrices.isEmpty ? 0.0 : meal.allPrices[0].value}",
              fontSize: sh(Dimens.k24),
              color: FYColors.mainRed,
            ),
          ],
        ),
      ],
    );
  }
}
