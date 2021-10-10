import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_yours_customer/common/widget/app_button.dart';
import 'package:food_yours_customer/common/widget/secondary_text_input_field.dart';
import 'package:food_yours_customer/home/controller/home_tab_back_panel_controller.dart';
import 'package:food_yours_customer/home/controller/home_tab_controller.dart';
import 'package:food_yours_customer/home/widget/food_category_item.dart';
import 'package:food_yours_customer/home/widget/fy_chip.dart';
import 'package:food_yours_customer/resources/Images.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/resources/icons.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:get/instance_manager.dart';

class HomeScreenBackPanel extends StatelessWidget {
  final HomeTabBackPanelController homeTabBackPanelCrtl = Get.put(HomeTabBackPanelController());
  final HomeTabController homeTabCrtl = Get.find<HomeTabController>();

  @override
  Widget build(BuildContext context) {
    final Function sh = sHeight(context);
    final Function sw = sWidth(context);

    return Container(
      color: FYColors.subtleBlack5,
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: sw(24)),
        children: [
          SizedBox(height: sh(28)),
          Stack(
            overflow: Overflow.visible,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: sh(80)),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Recent Searches",
                          style: context.theme.textTheme.caption!.copyWith(fontSize: Dimens.k16, fontWeight: FontWeight.w600)),
                      SizedBox(width: sw(17)),
                      Text("Clear",
                          style: context.theme.textTheme.headline3!
                              .copyWith(fontSize: Dimens.k12, fontWeight: FontWeight.w600, decoration: TextDecoration.underline)),
                    ],
                  ),
                  SizedBox(height: sh(Dimens.k16)),
                  Obx(
                    () => GridView.count(
                      shrinkWrap: true,
                      childAspectRatio: 2.5,
                      crossAxisSpacing: sw(0.0),
                      mainAxisSpacing: sw(0.0),
                      crossAxisCount: 3,
                      physics: NeverScrollableScrollPhysics(),
                      semanticChildCount: 6,
                      children: List.generate(homeTabBackPanelCrtl.resentSearches.length,
                          (index) => FYChip(homeTabBackPanelCrtl.resentSearches.value[index])),
                    ),
                  ),
                  SizedBox(height: sh(Dimens.k50)),
                  Text("Food Categories",
                      style: context.theme.textTheme.headline5!.copyWith(fontSize: sh(Dimens.k16), fontWeight: FontWeight.w700)),
                  SizedBox(height: sh(Dimens.k8)),
                  Obx(
                    () => GridView.count(
                      shrinkWrap: true,
                      childAspectRatio: 2.5,
                      crossAxisSpacing: sw(6.8),
                      mainAxisSpacing: sw(5.0),
                      crossAxisCount: 3,
                      physics: NeverScrollableScrollPhysics(),
                      semanticChildCount: 6,
                      children: List.generate(
                          homeTabBackPanelCrtl.homeTabCrtl.foodCategories.length,
                          (index) => FoodCategoryItem(homeTabBackPanelCrtl.homeTabCrtl.foodCategories.value[index],
                              onSelected: homeTabBackPanelCrtl.homeTabCrtl.onCategorySelected,
                              isSelected: index == homeTabBackPanelCrtl.homeTabCrtl.selectedFoodCategoryIndex.value,
                              selectedFoodCategoryIndex: index)),
                    ),
                  ),
                ],
              ),
              Positioned(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                            child: SecondaryTextField(
                          prefixIcon: Icon(FYIcons.search),
                          hintText: "Enter food name",
                        )),
                        SizedBox(width: sw(14.67)),
                        FYButton(
                          child: SvgPicture.asset(Images.settings, width: sw(26.67), height: sh(30.01)),
                          onTap: () {},
                        ),
                      ],
                    ),
                    Container(),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
