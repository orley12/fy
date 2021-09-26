import 'package:flutter/material.dart';
import 'package:food_yours_customer/chef_screen/controller/chef_screen_controller.dart';
import 'package:food_yours_customer/chef_screen/widget/food_detail_card.dart';
import 'package:food_yours_customer/home/widget/food_category_item.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class ChefMenuTab extends StatelessWidget {
  ChefMenuTab({required this.widgetCtrl});

  final ChefScreenController widgetCtrl;

  @override
  Widget build(BuildContext context) {
    final Function sh = sHeight(context);
    final Function sw = sWidth(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Food Categories", style: context.theme.textTheme.headline2!.copyWith(fontSize: sh(Dimens.k16))),
        SizedBox(height: sh(7)),
        Obx(
          () => GridView.count(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            childAspectRatio: 2.5,
            crossAxisSpacing: sw(6.8),
            mainAxisSpacing: sw(5.0),
            crossAxisCount: 3,
            physics: NeverScrollableScrollPhysics(),
            semanticChildCount: 3,
            children: List.generate(
                widgetCtrl.foodCategories.length,
                (index) => FoodCategoryItem(widgetCtrl.foodCategories.value[index],
                    onSelected: widgetCtrl.onCategorySelected,
                    isSelected: index == widgetCtrl.selectedFoodCategoryIndex.value,
                    selectedFoodCategoryIndex: index)),
          ),
        ),
        SizedBox(height: sh(40)),
        Text("African", style: context.theme.textTheme.headline2!.copyWith(fontSize: sh(Dimens.k16))),
        SizedBox(height: sh(Dimens.k16)),
        ListView.separated(
          padding: EdgeInsets.zero,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) => FoodDetailsCard(),
          separatorBuilder: (BuildContext context, int index) => SizedBox(height: sh(Dimens.k24)),
          itemCount: 10,
        ),
      ],
    );
  }
}
