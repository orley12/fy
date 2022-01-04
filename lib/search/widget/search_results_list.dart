import 'package:flutter/material.dart';
import 'package:food_yours_customer/home/view_model/meal_search_view_model.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/search/widget/search_result_card.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';

class SearchResultsList extends StatelessWidget {
  final List<MealSearchViewModel> mealViewModels;
  final Function(MealSearchViewModel)? onMealSelected;
  final Function(MealSearchViewModel)? onChefSelected;

  const SearchResultsList({
    Key? key,
    required this.mealViewModels,
    this.onChefSelected,
    this.onMealSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Function sh = sHeight(context);

    return ListView.separated(
      itemBuilder: (BuildContext context, int index) => SearchResultCard(
        mealViewModel: mealViewModels[index],
        onChefSelected: onChefSelected,
        onMealSelected: onMealSelected,
      ),
      separatorBuilder: (BuildContext context, int index) =>
          SizedBox(height: sh(Dimens.k24)),
      itemCount: mealViewModels.length,
    );
  }
}
