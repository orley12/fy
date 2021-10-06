import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class SocialMediaButton extends StatelessWidget {
  final String buttonText;
  final String buttonIcon;
  final Color buttonThemeColor;

  SocialMediaButton({required this.buttonThemeColor, required this.buttonText, required this.buttonIcon});

  @override
  Widget build(BuildContext context) {
    final Function sh = sHeight(context);
    final Function sw = sWidth(context);

    return Expanded(
      child: Container(
        height: sh(56),
        padding: EdgeInsets.symmetric(horizontal: sw(21)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(buttonIcon),
            Text(buttonText,
                style: context.theme.textTheme.headline4!
                    .copyWith(color: buttonThemeColor, fontSize: sh(Dimens.k16), fontWeight: FontWeight.w700)),
          ],
        ),
        decoration: BoxDecoration(border: Border.all(color: buttonThemeColor), borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}
