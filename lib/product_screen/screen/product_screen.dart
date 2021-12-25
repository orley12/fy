import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_yours_customer/common/widget/app_button.dart';
import 'package:food_yours_customer/common/widget/local_theme.dart';
import 'package:food_yours_customer/common/widget/secondary_text_input_field.dart';
import 'package:food_yours_customer/common/widget/text_button.dart';
import 'package:food_yours_customer/home/widget/fy_chip.dart';
import 'package:food_yours_customer/product_screen/controller/product_screen_controller.dart';
import 'package:food_yours_customer/product_screen/widget/meal_customisation_options.dart';
import 'package:food_yours_customer/product_screen/widget/article.dart';
import 'package:food_yours_customer/product_screen/widget/food_header.dart';
import 'package:food_yours_customer/product_screen/widget/meal_quantity_customisation_options.dart';
import 'package:food_yours_customer/resources/Images.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/resources/strings.dart';
import 'package:food_yours_customer/util/navigation_util.dart';
import 'package:get/route_manager.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

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
          SliverAppBar(
            automaticallyImplyLeading: false,
            leadingWidth: sw(80),
            leading: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(width: sw(24)),
                FYButton(
                  child: SvgPicture.asset(Images.back,
                      height: sh(40), width: sw(40)),
                  onTap: pop,
                )
              ],
            ),
            actions: [
              FYButton(
                onTap: widgetCtrl.gotoOrderSummary,
                child: Stack(
                  overflow: Overflow.visible,
                  children: [
                    SvgPicture.asset(Images.cart,
                        height: sh(40), width: sw(40)),
                    Positioned(
                      right: sw(0),
                      top: sh(3),
                      child: ValueListenableBuilder<Box>(
                        valueListenable:
                            Hive.box(Strings.RANDOM_INFORMATION_BOX)
                                .listenable(),
                        builder: (context, box, _) {
                          int cartItemsCount =
                              box.get(Strings.CART_ITEMS_COUNT) ?? 0;
                          return cartItemsCount < 1
                              ? Container()
                              : Text(
                                  "${cartItemsCount}",
                                  style: context.theme.textTheme.headline3!
                                      .copyWith(
                                    fontWeight: FontWeight.w800,
                                    color: FYColors.mainBlue,
                                    fontSize: sh(16),
                                  ),
                                );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: sw(24))
            ],
            expandedHeight: sh(Dimens.k295),
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: context.theme.backgroundColor,
                child: ClipRRect(
                    child: Obx(() => FadeInImage.assetNetwork(
                          placeholder: Images.search_result,
                          image: widgetCtrl.meal.value.mealPic,
                          fit: BoxFit.cover,
                        )),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(8.83),
                      bottomRight: Radius.circular(8.83),
                    )),
              ),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Obx(() => Text(widgetCtrl.meal.value.name,
                                  style: context.theme.textTheme.headline2!
                                      .copyWith(fontSize: sh(Dimens.k16)))),
                              SizedBox(height: sh(10)),
                              Wrap(
                                children: List.generate(
                                  widgetCtrl.meal.value.tags.length,
                                  (index) => Transform(
                                    transform: Matrix4.identity()..scale(0.8),
                                    child: FYChip(
                                        widgetCtrl.meal.value.tags[index],
                                        backgroundColor: FYColors.lighterBlack2,
                                        textColor: context
                                            .theme.textTheme.button!.color),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("Order Amount",
                                  style: context.theme.textTheme.headline2!
                                      .copyWith(
                                          fontSize: sh(Dimens.k12),
                                          color: FYColors.lighterBlack2,
                                          fontWeight: FontWeight.w400)),
                              Obx(() => Text(
                                  "N ${widgetCtrl.meal.value.allPrices.isEmpty ? 0.0 : widgetCtrl.meal.value.allPrices[0].value}",
                                  style: context.theme.textTheme.headline3!
                                      .copyWith(fontSize: sh(Dimens.k24)))),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Entypo.dot_single,
                            color: context.theme.textTheme.headline3!.color,
                          ),
                          Text("Scroll down to customize your order",
                              style: context.theme.textTheme.headline3!
                                  .copyWith(
                                      fontSize: sh(Dimens.k12),
                                      fontWeight: FontWeight.w400)),
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
                      Article(
                        title: "Ingredients",
                        description: widgetCtrl.meal.value.ingerdients,
                      ),
                      SizedBox(height: sh(80)),
                      FoodTableHeader(
                        leading: "Quantity",
                        trailing: "Single option",
                      ),
                      SizedBox(height: sh(Dimens.k16)),
                      Obx(
                        () => MealCustomizationQuantityOptions(
                            listItems: widgetCtrl.meal.value.allPrices,
                            onSelected: widgetCtrl.onQuantitySelected,
                            selectedItem: widgetCtrl.selectedQuantity.value),
                      ),
                      Divider(thickness: 0.4, height: 0),
                      SizedBox(height: sh(Dimens.k32)),
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
                      Divider(thickness: 0.4, height: 0),
                      SizedBox(height: sh(Dimens.k32)),
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
                      Divider(thickness: 0.4, height: 0),
                      SizedBox(height: sh(Dimens.k32)),
                      Text(
                        "Extra Instructions",
                        style: context.theme.textTheme.headline2!
                            .copyWith(fontSize: sh(Dimens.k14)),
                      ),
                      SizedBox(height: sh(7.0)),
                      SecondaryTextField(
                        keyboardType: TextInputType.multiline,
                        controller: widgetCtrl.noteTextController,
                        hintText:
                            "Please indicate any allergies or specifications",
                        maxLines: 8,
                      ),
                      SizedBox(height: sh(24.0)),
                      LocalTheme(
                          child: FYTextButton(
                            text: "Add to cart",
                            onPressed: widgetCtrl.addToCart,
                          ),
                          buttonStyle:
                              context.theme.textButtonTheme.style!.copyWith(
                            minimumSize: MaterialStateProperty.all<Size>(
                                Size(double.infinity, Dimens.k57)),
                          )),
                      SizedBox(height: sh(20.0)),
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
