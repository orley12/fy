import 'package:flutter/material.dart';
import 'package:food_yours_customer/auth/forgot_password/controller/forgot_password_confirmation_screen_controller.dart';
import 'package:food_yours_customer/common/widget/auth_pages_background_image.dart';
import 'package:food_yours_customer/common/widget/food_yours_logo.dart';
import 'package:food_yours_customer/common/widget/local_theme.dart';
import 'package:food_yours_customer/common/widget/text_button.dart';
import 'package:food_yours_customer/resources/Images.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:get/instance_manager.dart';

class ForgotPasswordConfirmationScreen extends StatelessWidget {
  final ForgetPasswordConfirmationScreenController
      forgotPasswordConfirmationScreenController =
      Get.put(ForgetPasswordConfirmationScreenController());

  @override
  Widget build(BuildContext context) {
    Function sh = sHeight(context);
    Function sw = sWidth(context);

    return Scaffold(
      body: Stack(
        children: [
          AuthPagesBackgroundImage(),
          ListView(
            padding: EdgeInsets.zero,
            children: [
              SizedBox(height: sh(Dimens.k99)),
              LocalTheme(
                backGroundColor: context.theme.primaryColor,
                child: FYLogo(
                    svgPath: Images.food_yours_logo,
                    height: sh(33.9),
                    width: sw(165)),
              ),
              SizedBox(height: sh(Dimens.k70)),
              _buildLoginForm(sw, context),
              SizedBox(height: sh(Dimens.k115)),
              Text(
                "Don’t have an account?",
                textAlign: TextAlign.center,
                style: context.theme.textTheme.headline5!
                    .copyWith(fontSize: sh(Dimens.k16)),
              ),
              Center(
                child: LocalTheme(
                  child: FYTextButton(
                    text: "Register Here",
                    onPressed: forgotPasswordConfirmationScreenController
                        .gotoRegistrationScreen,
                    decoration: TextDecoration.underline,
                  ),
                  // buttonStyle: whiteTextButtonStyle,
                  buttonTextStyle: context.theme.textTheme.headline3,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container _buildLoginForm(Function sw, BuildContext context) {
    Function sh = sHeight(context);
    Function sw = sWidth(context);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: sw(Dimens.k24)),
      height: sh(Dimens.k315),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(Dimens.k12),
        child: Card(
            elevation: 8,
            shadowColor: Color.fromRGBO(0, 99, 247, 0.2),
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: sw(Dimens.k27)),
              children: [
                SizedBox(height: sh(Dimens.k26)),
                Text(
                  "Confirm Email",
                  textAlign: TextAlign.center,
                  style: context.theme.textTheme.headline1!
                      .copyWith(fontSize: sh(Dimens.k24)),
                ),
                SizedBox(height: sh(Dimens.k8)),
                RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(children: [
                      TextSpan(
                        text:
                            "We sent a link to confirm your supplied email address"
                            "please click the link in the email we sent to verify"
                            "your email. Email: ",
                        style: context.theme.textTheme.headline4!
                            .copyWith(fontSize: sh(Dimens.k12)),
                      ),
                      TextSpan(
                        text: "johndoe@gmail.com",
                        style: context.theme.textTheme.headline1!.copyWith(
                            fontSize: sh(Dimens.k12),
                            color: FYColors.subtleBlue),
                        // recognizer: TapGestureRecognizer()
                        //   ..onTap = () async {
                        //     final url = 'johndoe@gmail.com';
                        //   },
                      )
                    ])),
                SizedBox(height: sh(Dimens.k40)),
                Center(
                  child: FYTextButton(
                    text: "Open email app",
                    onPressed: () {},
                  ),
                ),
                SizedBox(height: sh(Dimens.k20)),
              ],
            )),
      ),
    );
  }
}
