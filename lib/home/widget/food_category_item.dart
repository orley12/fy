import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:food_yours_customer/common/widget/app_button.dart';
import 'package:food_yours_customer/home/view_model/food_category_view_model.dart';
import 'package:food_yours_customer/resources/Images.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:shimmer/shimmer.dart';

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
              image: DecorationImage(
                  image: NetworkImage(
                    foodCategory.categoryImage,
                  ),
                  colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.75), BlendMode.darken),
                  fit: BoxFit.fill),
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

class FoodCategoryLoadingItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Function sh = sHeight(context);
    final Function sw = sWidth(context);

    return Shimmer.fromColors(
      child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xffeaf0f0),
                borderRadius: BorderRadius.circular(Dimens.k4),
                image: DecorationImage(image: AssetImage(Images.food_category), fit: BoxFit.fill),
              ))),
      baseColor: Color(0xffeaf0f0),
      highlightColor: Colors.white,
    );
  }
}
