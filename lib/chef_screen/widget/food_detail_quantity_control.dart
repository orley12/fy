import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_yours_customer/common/widget/app_button.dart';
import 'package:food_yours_customer/common/widget/local_theme.dart';
import 'package:food_yours_customer/common/widget/text_button.dart';
import 'package:food_yours_customer/resources/Images.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/style.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class FoodDetailQuantityControl extends StatelessWidget {
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
            FYButton(onTap: () {}, child: SvgPicture.asset(Images.minus_circle)),
            SizedBox(width: sw(29.51)),
            Text("0", style: context.theme.textTheme.headline5!.copyWith(fontWeight: FontWeight.w400, fontSize: 15.25)),
            SizedBox(width: sw(31.04)),
            FYButton(onTap: () {}, child: SvgPicture.asset(Images.plus_circle))
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
              onPressed: () {},
              decoration: TextDecoration.underline,
            ),
            buttonStyle: whiteTextButtonStyle.copyWith(minimumSize: MaterialStateProperty.all<Size>(Size(sw(88), sh(37)))),
            buttonTextStyle: context.theme.textTheme.headline3!
                .copyWith(color: FYColors.mainBlue, fontSize: sh(15.25), fontWeight: FontWeight.w400),
          ),
        ),
      ],
    );
  }
}
