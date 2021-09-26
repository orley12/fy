import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:food_yours_customer/common/widget/app_button.dart';
import 'package:food_yours_customer/home/view_model/food_category_view_model.dart';
import 'package:food_yours_customer/resources/Images.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_utils/get_utils.dart';

class FoodCategoryItem extends StatelessWidget {
  final FoodCategoryViewModel foodCategory;
  final Function(int index, FoodCategoryViewModel foodCategory)? onSelected;
  final bool? isSelected;
  final int selectedFoodCategoryIndex;

  FoodCategoryItem(this.foodCategory, {this.isSelected = false, this.onSelected, required this.selectedFoodCategoryIndex});

  @override
  Widget build(BuildContext context) {
    final Function sh = sHeight(context);
    final Function sw = sWidth(context);

    return FYButton(
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: isSelected! ? FYColors.mainGreen : Colors.transparent),
              borderRadius: BorderRadius.circular(Dimens.k4),
              image: DecorationImage(image: AssetImage(foodCategory.categoryImagePath), fit: BoxFit.fill),
            ),
          ),
          Center(
            child: Text(foodCategory.categoryName,
                textAlign: TextAlign.center,
                style: context.theme.textTheme.button!.copyWith(fontSize: sh(Dimens.k12), fontWeight: FontWeight.w600)),
          )
        ],
      ),
      onTap: () => onSelected == null ? null : onSelected!(selectedFoodCategoryIndex, foodCategory),
    );
  }
}
