import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_yours_customer/common/widget/app_button.dart';
import 'package:food_yours_customer/common/widget/secondary_text_input_field.dart';
import 'package:food_yours_customer/search_screen/controller/search_screen_controller.dart';
import 'package:food_yours_customer/home/widget/home_app_bar.dart';
import 'package:food_yours_customer/resources/Images.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/resources/icons.dart';
import 'package:food_yours_customer/search_screen/widget/search_result_card.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:get/instance_manager.dart';

class SearchScreen extends StatelessWidget {
  final SearchScreenController widgetCrtl = Get.put(SearchScreenController());

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
                      controller: widgetCrtl.searchTextEditingController,
                    )),
                    SizedBox(width: sw(14.67)),
                    FYButton(
                      child: SvgPicture.asset(Images.settings, width: sw(26.67), height: sh(30.01)),
                      onTap: widgetCrtl.gotoFilterScreen,
                    ),
                  ],
                ),
                Container(),
                SizedBox(height: sh(Dimens.k24)),
                buildItemsFoundText(sw, context),
                SizedBox(height: sh(Dimens.k12)),
                Expanded(
                  child: ListView.separated(
                    itemBuilder: (BuildContext context, int index) => SearchResultCard(
                      index: index,
                      widgetCtrl: widgetCrtl,
                    ),
                    separatorBuilder: (BuildContext context, int index) => SizedBox(height: sh(Dimens.k24)),
                    itemCount: 10,
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
