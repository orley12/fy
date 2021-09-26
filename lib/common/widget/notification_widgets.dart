import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_yours_customer/common/widget/app_button.dart';
import 'package:food_yours_customer/common/widget/local_theme.dart';
import 'package:food_yours_customer/common/widget/text_button.dart';
import 'package:food_yours_customer/resources/Images.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/resources/icons.dart';
import 'package:food_yours_customer/resources/style.dart';
import 'package:food_yours_customer/util/navigation_util.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get.dart';

showAlertDialog(
    [String? notificationIcon,
    String title = "Location Access",
    String message =
        "Foodyours is asking for permission to access your device location to give you best ordering experience.This permission is required for ordering.",
    isSuccess = false]) {
  final Function sh = sHeight(Get.context!);
  final Function sw = sWidth(Get.context!);

  Get.dialog(
      Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: sw(24.0)),
              height: sh(Dimens.k277),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(Dimens.k12),
                child: Card(
                    child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: sh(17.0)),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: sh(Dimens.k20)),
                      SvgPicture.asset(notificationIcon ?? Images.notification_symbol, width: sw(40), height: sh(40)),
                      SizedBox(height: sh(Dimens.k16)),
                      Text(title,
                          style: Get.context!.theme.textTheme.headline5!.copyWith(
                              fontSize: sh(Dimens.k16),
                              fontWeight: FontWeight.w700,
                              color: isSuccess ? FYColors.mainGreen : null)),
                      SizedBox(height: sh(Dimens.k24)),
                      Container(
                          width: sw(293),
                          child: Text(
                            message,
                            textAlign: TextAlign.center,
                            style: Get.context!.theme.textTheme.headline4!.copyWith(fontSize: sh(Dimens.k12)),
                          )),
                      SizedBox(height: sh(Dimens.k24)),
                      buildActionButtons(isSuccess),
                    ],
                  ),
                )),
              ),
            ),
            SizedBox(height: sh(Dimens.k40)),
            buildCancelButton(sw, sh),
          ],
        ),
      ),
      useSafeArea: true,
      barrierColor: Colors.black.withOpacity(0.85));
}

FYButton buildCancelButton(Function sw, Function sh) {
  return FYButton(
    child: Container(
      width: sw(Dimens.k40),
      height: sh(Dimens.k40),
      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
      child: Icon(FYIcons.x),
    ),
    onTap: pop,
  );
}

Row buildActionButtons(isSuccess) {
  final Function sh = sHeight(Get.context!);
  final Function sw = sWidth(Get.context!);

  return Row(mainAxisAlignment: isSuccess ? MainAxisAlignment.center : MainAxisAlignment.spaceBetween, children: [
    Center(
      child: LocalTheme(
        child: FYTextButton(text: "Discard", onPressed: pop),
        buttonStyle: whiteTextButtonStyle.copyWith(minimumSize: MaterialStateProperty.all<Size>(Size(sw(133), sh(Dimens.k47)))),
        buttonTextStyle: Get.context!.theme.textTheme.caption!.copyWith(fontWeight: FontWeight.w600),
      ),
    ),
    isSuccess
        ? Container()
        : Center(
            child: LocalTheme(
              child: FYTextButton(text: "Grant Access"),
              buttonStyle: Get.context!.theme.textButtonTheme.style!
                  .copyWith(minimumSize: MaterialStateProperty.all<Size>(Size(sw(133), sh(Dimens.k47)))),
              buttonTextStyle: Get.context!.theme.textTheme.button!.copyWith(fontWeight: FontWeight.w400),
            ),
          ),
  ]);
}
