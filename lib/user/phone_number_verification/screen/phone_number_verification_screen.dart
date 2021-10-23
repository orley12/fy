import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:food_yours_customer/common/widget/local_theme.dart';
import 'package:food_yours_customer/common/widget/text_button.dart';
import 'package:food_yours_customer/home/widget/home_app_bar.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/resources/style.dart';
import 'package:food_yours_customer/user/view_model/user_view_model.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class PhoneNumberVerificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Function sh = sHeight(context);
    Function sw = sWidth(context);

    return Container(
      color: FYColors.subtleBlack5,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: FYColors.subtleBlack5,
          appBar: PreferredSize(preferredSize: Size(20, sh(46.41)), child: HomeAppBar(UserViewModel())),
          body: ListView(
            padding: EdgeInsets.symmetric(horizontal: sw(24)),
            children: [
              SizedBox(height: sh(54)),
              AutoSizeText("Phone Number:",
                  minFontSize: 4, maxLines: 3, style: context.theme.textTheme.headline4!.copyWith(fontSize: sh(Dimens.k16))),
              SizedBox(height: sh(5)),
              Row(
                children: [
                  AutoSizeText(
                    "07123456789",
                    minFontSize: 4,
                    maxLines: 3,
                    style: context.theme.textTheme.caption!
                        .copyWith(fontSize: sh(Dimens.k16), fontWeight: FontWeight.w400, color: FYColors.darkerBlack2),
                  ),
                  Center(
                    child: LocalTheme(
                      child: FYTextButton(
                        text: "Change",
                        onPressed: () {},
                        decoration: TextDecoration.underline,
                      ),
                      buttonStyle:
                          whiteTextButtonStyle.copyWith(minimumSize: MaterialStateProperty.all<Size>(Size(sw(88), sh(37)))),
                      buttonTextStyle: context.theme.textTheme.headline3!
                          .copyWith(color: FYColors.mainBlue, fontSize: sh(15.25), fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
              SizedBox(height: sh(44)),
              FYTextButton(
                text: "Request for verification code",
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
