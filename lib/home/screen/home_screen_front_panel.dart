import 'package:flutter/material.dart';
import 'package:food_yours_customer/home/controller/home_tab_controller.dart';
import 'package:food_yours_customer/home/controller/home_tab_front_panel_controller.dart';
import 'package:food_yours_customer/home/widget/ad_space.dart';
import 'package:food_yours_customer/home/widget/food_category_item.dart';
import 'package:food_yours_customer/home/widget/large_order_banner.dart';
import 'package:food_yours_customer/home/widget/popular_chef_item.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:get/instance_manager.dart';

class HomeScreenFrontPanel extends StatelessWidget {
  final HomeTabFrontPanelController homeTabFrontPanelCrtl = Get.put(HomeTabFrontPanelController());
  final HomeTabController homeTabCrtl = Get.find<HomeTabController>();

  @override
  Widget build(BuildContext context) {
    final Function sh = sHeight(context);
    final Function sw = sWidth(context);

    return Container(
      color: context.theme.backgroundColor,
      child: ListView(padding: EdgeInsets.zero, children: [
        SizedBox(height: sh(10.59)),
        Container(
          padding: EdgeInsets.symmetric(horizontal: sw(25)),
          child: Text("Food Categories",
              style: context.theme.textTheme.headline5!.copyWith(fontSize: sh(Dimens.k16), fontWeight: FontWeight.w700)),
        ),
        SizedBox(height: sh(Dimens.k8)),
        Obx(
          () => GridView.count(
            shrinkWrap: true,
            childAspectRatio: 2.5,
            crossAxisSpacing: sw(6.8),
            mainAxisSpacing: sw(5.0),
            crossAxisCount: 3,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: sw(25)),
            semanticChildCount: 6,
            children: List.generate(
                homeTabFrontPanelCrtl.homeTabCrtl.foodCategories.length,
                (index) => homeTabCrtl.isLoadingFoodCategories.value
                    ? FoodCategoryLoadingItem()
                    : FoodCategoryItem(homeTabCrtl.foodCategories.value[index],
                        onSelected: homeTabCrtl.onCategorySelected,
                        isSelected: index == homeTabCrtl.selectedFoodCategoryIndex.value,
                        selectedFoodCategoryIndex: index)),
          ),
        ),
        SizedBox(height: sh(Dimens.k16)),
        Container(
          padding: EdgeInsets.symmetric(horizontal: sw(25)),
          child: Text("Popular chefs around you",
              style: context.theme.textTheme.headline5!.copyWith(fontSize: sh(Dimens.k16), fontWeight: FontWeight.w700)),
        ),
        SizedBox(height: sh(Dimens.k10)),
        Container(
          height: sh(141.18),
          padding: EdgeInsets.only(left: sw(25)),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext buildContext, int index) => Obx(() => homeTabCrtl.isLoadingFoodCategories.value
                ? PopularChefLoadingItem()
                : PopularChefItem(
                    homeTabFrontPanelCrtl.homeTabCrtl.popularChefs.value[index],
                  )),
            itemCount: homeTabFrontPanelCrtl.homeTabCrtl.popularChefs.value.length,
            separatorBuilder: (BuildContext context, int index) => SizedBox(width: sw(Dimens.k16)),
          ),
        ),
        SizedBox(height: sh(23.82)),
        Container(
          child: AdSpace(/* widgetCrtl.homeTabCrtl.openAlertDialog */ null),
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: sw(24)),
        ),
        SizedBox(height: sh(13)),
        Container(
            padding: EdgeInsets.symmetric(horizontal: sw(25)),
            child: Text("Top chefs in your city",
                style: context.theme.textTheme.headline5!.copyWith(fontSize: sh(Dimens.k16), fontWeight: FontWeight.w700))),
        SizedBox(height: sh(Dimens.k8)),
        Obx(
          () => Container(
            height: sh(141.18),
            padding: EdgeInsets.only(left: sw(25)),
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext buildContext, int index) => Obx(() => homeTabCrtl.isLoadingFoodCategories.value
                  ? PopularChefLoadingItem()
                  : PopularChefItem(
                      homeTabFrontPanelCrtl.homeTabCrtl.popularChefs.value[index],
                    )),
              itemCount: homeTabFrontPanelCrtl.homeTabCrtl.popularChefs.value.length,
              separatorBuilder: (BuildContext context, int index) => SizedBox(width: sw(Dimens.k16)),
            ),
          ),
        ),
        SizedBox(height: sh(43.82)),
        Obx(() => Container(
              child: homeTabCrtl.isLoadingFoodCategories.value ? LargeOrderBannerLoadingItem() : LargeOrderBanner(),
              width: sw(Dimens.k327),
            )),
        SizedBox(height: sh(28)),
      ]),
    );
  }
}
