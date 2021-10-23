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

class OtpVerificationScreen extends StatelessWidget {
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
              SizedBox(height: sh(44)),
              Text("Enter OTP",
                  style: context.theme.textTheme.caption!
                      .copyWith(fontSize: sh(Dimens.k24), fontWeight: FontWeight.w600, color: FYColors.darkerBlack2)),
              SizedBox(height: sh(24)),
              Text("We sent a 5 digit one-time password to your registered number, please input it below.",
                  style: context.theme.textTheme.headline4!.copyWith(fontSize: sh(Dimens.k16))),
              SizedBox(height: sh(28)),
              FYTextButton(
                text: "Verify",
                onPressed: () {},
              ),
              SizedBox(height: sh(64)),
              Text("Didn’t receive any code? Please wait few minutes before requesting for a new one.",
                  textAlign: TextAlign.center, style: context.theme.textTheme.headline4!.copyWith(fontSize: sh(Dimens.k16))),
              SizedBox(height: sh(24)),
              Center(
                child: LocalTheme(
                  child: FYTextButton(
                    text: "Resend Code",
                    onPressed: () {},
                    decoration: TextDecoration.underline,
                  ),
                  buttonStyle: whiteTextButtonStyle.copyWith(backgroundColor: MaterialStateProperty.all(FYColors.subtleBlack5)),
                  buttonTextStyle: context.theme.textTheme.headline3,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
