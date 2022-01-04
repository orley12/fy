import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_icons/flutter_icons.dart';
import 'package:food_yours_customer/common/widget/button/fy_text_button.dart';
import 'package:food_yours_customer/common/widget/text/mulish_400_text.dart';
import 'package:food_yours_customer/common/widget/text/mulish_600_text.dart';
import 'package:food_yours_customer/common/widget/text_field/secondary_text_field.dart';
import 'package:food_yours_customer/product_screen/controller/product_screen_controller.dart';
import 'package:food_yours_customer/product_screen/widget/meal_customisation_options.dart';
import 'package:food_yours_customer/product_screen/widget/article.dart';
import 'package:food_yours_customer/product_screen/widget/food_header.dart';
import 'package:food_yours_customer/product_screen/widget/meal_quantity_customisation_options.dart';
import 'package:food_yours_customer/product_screen/widget/product_tile.dart';
import 'package:food_yours_customer/product_screen/widget/timeline.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:get/route_manager.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class ProductScreen extends StatelessWidget {
  final ProductScreenController widgetCtrl = Get.put(ProductScreenController());

  @override
  Widget build(BuildContext context) {
    final Function sh = sHeight(context);
    final Function sw = sWidth(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: <Widget>[
          Obx(
            () => Timeline(
              onCartPressed: widgetCtrl.gotoOrderSummary,
              timelineImage: widgetCtrl.meal.value.mealPic,
              animationCtrl: widgetCtrl.animationCtrl,
              animation: widgetCtrl.animation,
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: sw(24)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: sh(Dimens.k8)),
                      Obx(
                        () => ProductTitle(
                          meal: widgetCtrl.meal.value,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Entypo.dot_single,
                            color: context.theme.textTheme.headline3!.color,
                          ),
                          Mulish400Text(
                            text: "Scroll down to customize your order",
                            fontSize: sh(Dimens.k12),
                            color: FYColors.mainRed,
                          ),
                        ],
                      ),
                      Divider(
                          color: FYColors.subtleBlack2.withOpacity(0.8),
                          thickness: 0.5),
                      SizedBox(height: sh(Dimens.k32)),
                      Obx(
                        () => Article(
                          title: "Descriptions",
                          description: widgetCtrl.meal.value.description,
                        ),
                      ),
                      SizedBox(height: sh(Dimens.k32)),
                      Obx(
                        () => Article(
                          title: "Ingredients",
                          description: widgetCtrl.meal.value.ingerdients,
                        ),
                      ),
                      SizedBox(height: sh(80)),
                      FoodTableHeader(
                        leading: "Quantity",
                        trailing: "Single option",
                      ),
                      SizedBox(
                        height: sh(Dimens.k16),
                      ),
                      Obx(
                        () => MealCustomizationQuantityOptions(
                            listItems: widgetCtrl.meal.value.allPrices,
                            onSelected: widgetCtrl.onQuantitySelected,
                            selectedItem: widgetCtrl.selectedQuantity.value),
                      ),
                      Divider(
                        thickness: 0.4,
                        height: 0,
                      ),
                      SizedBox(
                        height: sh(Dimens.k32),
                      ),
                      FoodTableHeader(
                          leading: "Suppliments",
                          trailing: "Select up to 4 options"),
                      SizedBox(height: sh(Dimens.k16)),
                      Obx(
                        () => MealCustomizationOptions(
                            listItems: widgetCtrl.meal.value.suppliments,
                            onSelected: widgetCtrl.onSupplimentSelected,
                            selectedItems:
                                widgetCtrl.selectedSuppliments.value),
                      ),
                      Divider(
                        thickness: 0.4,
                        height: 0,
                      ),
                      SizedBox(
                        height: sh(Dimens.k32),
                      ),
                      FoodTableHeader(
                          leading: "Extras",
                          trailing: "Select up to 2 options"),
                      SizedBox(height: sh(Dimens.k16)),
                      Obx(
                        () => MealCustomizationOptions(
                            listItems: widgetCtrl.meal.value.extras,
                            onSelected: widgetCtrl.onExtrasSelected,
                            selectedItems: widgetCtrl.selectedExtras.value),
                      ),
                      Divider(
                        thickness: 0.4,
                        height: 0,
                      ),
                      SizedBox(
                        height: sh(Dimens.k32),
                      ),
                      Mulish600Text(
                        text: "Extra Instructions",
                        color: FYColors.darkerBlack7,
                        fontSize: sh(Dimens.k14),
                      ),
                      SizedBox(
                        height: sh(7.0),
                      ),
                      SecondaryTextField(
                        keyboardType: TextInputType.multiline,
                        controller: widgetCtrl.noteTextController,
                        hintText:
                            "Please indicate any allergies or specifications",
                        maxLines: 8,
                      ),
                      SizedBox(
                        height: sh(24.0),
                      ),
                      FYTextButton(
                        text: "Add to cart",
                        onPressed: widgetCtrl.addToCart,
                      ),
                      SizedBox(
                        height: sh(20.0),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
