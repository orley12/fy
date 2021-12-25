import 'package:flutter/material.dart';
import 'package:food_yours_customer/common/widget/local_theme.dart';
import 'package:food_yours_customer/common/widget/text_button.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/resources/style.dart';
import 'package:food_yours_customer/util/navigation_util.dart';
import 'package:get/route_manager.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class FYTwinButton extends StatelessWidget {
  final bool isSuccess;
  final Color firstBtnColor;
  final String firstBtnText;
  final Color secondBtnColor;
  final String secondBtnText;
  final Color firstBtnTextColor;
  final bool spaced;
  final Function()? firstBtnAction;
  final Function()? secondBtnAction;

  FYTwinButton(
      {this.isSuccess = true,
      this.firstBtnText = "",
      this.firstBtnTextColor = const Color(0xFF6C6E90),
      this.firstBtnColor = Colors.white,
      this.secondBtnText = "",
      this.spaced = false,
      this.secondBtnColor = const Color(0xFFE20612),
      this.firstBtnAction,
      this.secondBtnAction});

  @override
  Widget build(BuildContext context) {
    final Function sh = sHeight(context);
    final Function sw = sWidth(context);

    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Center(
        child: LocalTheme(
          child: FYTextButton(text: firstBtnText, onPressed: pop),
          buttonStyle: whiteTextButtonStyle.copyWith(
              minimumSize: MaterialStateProperty.all<Size>(
                  Size(sw(133), sh(Dimens.k47))),
              backgroundColor: MaterialStateProperty.all<Color>(firstBtnColor)),
          buttonTextStyle: context.theme.textTheme.caption!
              .copyWith(fontWeight: FontWeight.w400, color: firstBtnTextColor),
        ),
      ),
      SizedBox(width: sw(spaced ? 8.13 : 0.0)),
      isSuccess
          ? Container()
          : Center(
              child: LocalTheme(
                child: FYTextButton(
                    text: secondBtnText, onPressed: secondBtnAction),
                buttonStyle: context.theme.textButtonTheme.style!.copyWith(
                    minimumSize: MaterialStateProperty.all<Size>(
                        Size(sw(133), sh(Dimens.k47))),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(secondBtnColor)),
                buttonTextStyle: context.theme.textTheme.button!.copyWith(
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
    ]);
  }
}
