import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_yours_customer/chef_screen/controller/chef_screen_controller.dart';
import 'package:food_yours_customer/common/widget/app_button.dart';
import 'package:food_yours_customer/common/widget/local_theme.dart';
import 'package:food_yours_customer/common/widget/text_button.dart';
import 'package:food_yours_customer/home/view_model/meal_search_view_model.dart';
import 'package:food_yours_customer/resources/Images.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/style.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:get/instance_manager.dart';

class FoodDetailQuantityControl extends StatelessWidget {
  final ChefScreenController widgetCtrl = Get.put(ChefScreenController());
  final int count;
  final MealSearchViewModel mealSearchViewModel;

  FoodDetailQuantityControl(this.mealSearchViewModel, this.count);

  @override
  Widget build(BuildContext context) {
    Function sh = sHeight(context);
    Function sw = sWidth(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            FYButton(
                onTap: () => widgetCtrl.removeItemfromCart(mealSearchViewModel),
                child: SvgPicture.asset(Images.minus_circle)),
            SizedBox(width: sw(29.51)),
            Text(count.toString(),
                style: context.theme.textTheme.headline5!
                    .copyWith(fontWeight: FontWeight.w400, fontSize: 15.25)),
            SizedBox(width: sw(31.04)),
            FYButton(
                onTap: () => widgetCtrl.addItemToCart(mealSearchViewModel),
                child: SvgPicture.asset(Images.plus_circle))
          ],
        ),
        VerticalDivider(
          thickness: 0.19,
          color: Colors.black,
          endIndent: 10,
        ),
        Center(
          child: LocalTheme(
            child: FYTextButton(
              text: "Details",
              onPressed: () => widgetCtrl.loadMeal(mealSearchViewModel),
              decoration: TextDecoration.underline,
            ),
            buttonStyle: whiteTextButtonStyle.copyWith(
                minimumSize:
                    MaterialStateProperty.all<Size>(Size(sw(88), sh(37)))),
            buttonTextStyle: context.theme.textTheme.headline3!.copyWith(
                color: FYColors.mainBlue,
                fontSize: sh(15.25),
                fontWeight: FontWeight.w400),
          ),
        ),
      ],
    );
  }
}
