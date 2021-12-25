import 'package:flutter/material.dart';
import 'package:food_yours_customer/cart/model/cart_model.dart';
import 'package:food_yours_customer/chef_screen/controller/chef_screen_controller.dart';
import 'package:food_yours_customer/chef_screen/widget/food_detail_card.dart';
import 'package:food_yours_customer/home/widget/food_category_item.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/resources/strings.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:get/instance_manager.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ChefMenuTab extends StatelessWidget {
  final ChefScreenController widgetCtrl = Get.put(ChefScreenController());

  @override
  Widget build(BuildContext context) {
    final Function sh = sHeight(context);
    final Function sw = sWidth(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Food Categories",
            style: context.theme.textTheme.headline2!
                .copyWith(fontSize: sh(Dimens.k16))),
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
                (index) => FoodCategoryItem(
                    widgetCtrl.foodCategories.value[index],
                    onSelected: widgetCtrl.onCategorySelected,
                    isSelected:
                        index == widgetCtrl.selectedFoodCategoryIndex.value,
                    selectedFoodCategoryIndex: index)),
          ),
        ),
        SizedBox(height: sh(40)),
        Text("${widgetCtrl.tags.isNotEmpty ? widgetCtrl.tags.value[0] : ""}",
            style: context.theme.textTheme.headline2!
                .copyWith(fontSize: sh(Dimens.k16))),
        SizedBox(height: sh(Dimens.k16)),
        ValueListenableBuilder<Box>(
            valueListenable: Hive.box(Strings.CART_BOX).listenable(),
            builder: (context, box, _) {
              return ListView.separated(
                padding: EdgeInsets.zero,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  CartModel cartModel = box.values.firstWhere(
                      (element) =>
                          element.id == widgetCtrl.chefMeals.value[index].id,
                      orElse: () => CartModel());
                  print("zzzzzzzzzzzzzz${cartModel.toString()}");
                  return FoodDetailsCard(
                    widgetCtrl.chefMeals.value[index],
                    cartModel.count,
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    SizedBox(height: sh(Dimens.k24)),
                itemCount: widgetCtrl.chefMeals.value.length,
              );
            }),
      ],
    );
  }
}
