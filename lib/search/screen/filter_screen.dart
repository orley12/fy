import 'package:flutter/material.dart';
import 'package:food_yours_customer/common/view_model/global_objects.dart';
import 'package:food_yours_customer/common/widget/fy_outline_button.dart';
import 'package:food_yours_customer/common/widget/local_theme.dart';
import 'package:food_yours_customer/common/widget/primary_app_bar.dart';
import 'package:food_yours_customer/common/widget/text_button.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/resources/style.dart';
import 'package:food_yours_customer/search/controller/filter_screen_controller.dart';
import 'package:food_yours_customer/search/widget/filter_category_options.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:get/instance_manager.dart';

class FilterScreen extends StatelessWidget {
  final FilterScreenController widgetController =
      Get.put(FilterScreenController());

  @override
  Widget build(BuildContext context) {
    Function sh = sHeight(context);
    Function sw = sWidth(context);

    return Container(
        color: FYColors.subtleBlack5,
        child: SafeArea(
            child: Scaffold(
          backgroundColor: FYColors.subtleBlack5,
          appBar: PreferredSize(
              preferredSize: Size(20, sh(46.41)),
              child: PrimaryAppBar(title: "Filter")),
          body: ListView(
            padding: EdgeInsets.symmetric(horizontal: sw(24), vertical: sh(24)),
            children: [
              Text(
                "Filter Tags",
                style: context.theme.textTheme.caption!.copyWith(
                    fontSize: sh(Dimens.k24),
                    fontWeight: FontWeight.w600,
                    color: FYColors.darkerBlack2),
              ),
              SizedBox(height: sh(16)),
              Text(
                "Categories",
                style: context.theme.textTheme.caption!.copyWith(
                    fontSize: sh(Dimens.k16),
                    fontWeight: FontWeight.w600,
                    color: FYColors.darkerBlack2),
              ),
              Obx(
                () => FilterCategoryOptions(
                  listItems: foodCategories,
                  onSelected: widgetController.onCategorySelected,
                  selectedIndex: widgetController.selectedCategoryIndex.value,
                ),
              ),
              Divider(thickness: 0.5, height: sh(24)),
              Text(
                "Chef Ratings",
                style: context.theme.textTheme.caption!.copyWith(
                    fontSize: sh(Dimens.k16),
                    fontWeight: FontWeight.w600,
                    color: FYColors.darkerBlack2),
              ),
              Obx(
                () => FilterCategoryOptions(
                  listItems: widgetController.ratings.value,
                  onSelected: widgetController.onRatingSelected,
                  selectedIndex: widgetController.selectedRatingIndex.value,
                ),
              ),
              Divider(thickness: 0.5, height: sh(24)),
              Text(
                "Pricing",
                style: context.theme.textTheme.caption!.copyWith(
                    fontSize: sh(Dimens.k16),
                    fontWeight: FontWeight.w600,
                    color: FYColors.darkerBlack2),
              ),
              Obx(
                () => FilterCategoryOptions(
                  listItems: widgetController.pricing.value,
                  onSelected: widgetController.onPricingSelected,
                  selectedIndex: widgetController.selectedPricingIndex.value,
                ),
              ),
              Divider(thickness: 0.5, height: sh(24)),
              Text(
                "Distance",
                style: context.theme.textTheme.caption!.copyWith(
                    fontSize: sh(Dimens.k16),
                    fontWeight: FontWeight.w600,
                    color: FYColors.darkerBlack2),
              ),
              Obx(
                () => FilterCategoryOptions(
                  listItems: widgetController.distanceFilteringOptions.value,
                  onSelected:
                      widgetController.onDistanceFilteringOptionSelected,
                  selectedIndex: widgetController.distanceFilteringOption.value,
                ),
              ),
              Divider(thickness: 0.5, height: sh(24)),
              Text(
                "Delivery Time",
                style: context.theme.textTheme.caption!.copyWith(
                    fontSize: sh(Dimens.k16),
                    fontWeight: FontWeight.w600,
                    color: FYColors.darkerBlack2),
              ),
              Obx(
                () => FilterCategoryOptions(
                  listItems:
                      widgetController.deliveryTimeFilteringOptions.value,
                  onSelected: widgetController.onDeliveryTimeSelected,
                  selectedIndex:
                      widgetController.deliveryTimeFilteringOption.value,
                ),
              ),
              SizedBox(height: sh(59.0)),
              Container(
                width: double.maxFinite,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Center(
                      child: LocalTheme(
                        child: FYOutlineButton(
                          text: "Clear",
                          onPressed: () {},
                          fontSize: sh(16),
                        ),
                        // outlineButtonStyle: whiteTextButtonStyle.copyWith(
                        //   minimumSize: MaterialStateProperty.all<Size>(
                        //     Size(sw(140), sh(47)),
                        //   ),
                        // ),
                        buttonTextStyle:
                            labelTextStyle.copyWith(fontSize: sh(16)),
                      ),
                    ),
                    SizedBox(height: sh(Dimens.k24)),
                    LocalTheme(
                      child: FYTextButton(
                        text: "Apply",
                        onPressed: widgetController.applyCategoryFilter,
                      ),
                      buttonStyle: context.theme.textButtonTheme.style!
                          .copyWith(
                              minimumSize: MaterialStateProperty.all<Size>(
                                  Size(sw(140), sh(47)))),
                      buttonTextStyle: context.theme.textTheme.button!
                          .copyWith(fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )));
  }
}
