import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_yours_customer/common/widget/app_button.dart';
import 'package:food_yours_customer/common/widget/secondary_text_input_field.dart';
import 'package:food_yours_customer/resources/Images.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/resources/icons.dart';
import 'package:food_yours_customer/search/controller/search_screen_controller.dart';
import 'package:food_yours_customer/search/widget/search_result_card.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:get/instance_manager.dart';

class SearchScreen extends StatelessWidget {
  late SearchScreenController widgetCtrl;

  SearchScreen() {
    if (Get.isRegistered<SearchScreenController>()) Get.delete<SearchScreenController>();
    widgetCtrl = Get.put(SearchScreenController());
  }

  @override
  Widget build(BuildContext context) {
    final Function sh = sHeight(context);
    final Function sw = sWidth(context);

    return Container(
      color: context.theme.backgroundColor,
      child: SafeArea(
        child: Scaffold(
          body: Container(
            padding: EdgeInsets.symmetric(horizontal: sw(Dimens.k24)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: sh(26)),
                Row(
                  children: [
                    Expanded(
                        child: SecondaryTextField(
                      prefixIcon: Icon(FYIcons.search),
                      hintText: "Enter food name",
                      controller: widgetCtrl.searchTextEditingController,
                    )),
                    SizedBox(width: sw(14.67)),
                    FYButton(
                      child: SvgPicture.asset(Images.settings, width: sw(26.67), height: sh(30.01)),
                      onTap: widgetCtrl.gotoFilterScreen,
                    ),
                  ],
                ),
                Container(),
                SizedBox(height: sh(Dimens.k24)),
                buildItemsFoundText(sw, context),
                SizedBox(height: sh(Dimens.k12)),
                Expanded(
                  child: Obx(
                    () => ListView.separated(
                      itemBuilder: (BuildContext context, int index) => SearchResultCard(
                        mealViewModel: widgetCtrl.meals.value[index],
                        onChefPressed: widgetCtrl.goToChefProfile,
                        onMealPressed: widgetCtrl.gotoMealScreen,
                      ),
                      separatorBuilder: (BuildContext context, int index) => SizedBox(height: sh(Dimens.k24)),
                      itemCount: widgetCtrl.meals.value.length,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container buildItemsFoundText(Function sw, BuildContext context) {
    return Container(
      width: sw(238),
      child: RichText(
        textAlign: TextAlign.start,
        text: TextSpan(children: <TextSpan>[
          TextSpan(
            style: context.theme.textTheme.caption!.copyWith(fontSize: Dimens.k12),
            text: "22 menu items found on ",
          ),
          TextSpan(
            style: context.theme.textTheme.caption!.copyWith(fontSize: Dimens.k12, fontWeight: FontWeight.w600),
            text: "Jollof Rice ",
          ),
          TextSpan(
            style: context.theme.textTheme.caption!.copyWith(fontSize: Dimens.k12),
            text: "around your location. Change location here.",
          ),
        ]),
      ),
    );
  }
}
