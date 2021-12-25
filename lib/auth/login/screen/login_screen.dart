import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_icons/flutter_icons.dart';
import 'package:food_yours_customer/auth/login/controller/login_screen_controller.dart';
import 'package:food_yours_customer/common/widget/app_button.dart';
import 'package:food_yours_customer/common/widget/auth_pages_bacground_image.dart';
import 'package:food_yours_customer/common/widget/food_yours_logo.dart';
import 'package:food_yours_customer/common/widget/loader.dart';
import 'package:food_yours_customer/common/widget/local_theme.dart';
import 'package:food_yours_customer/common/widget/text_button.dart';
import 'package:food_yours_customer/common/widget/primary_text_input_field.dart';
import 'package:food_yours_customer/resources/Images.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/resources/style.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:get/instance_manager.dart';

class LoginScreen extends StatelessWidget {
  final LoginScreenController widgetCtrl = Get.put(LoginScreenController());

  @override
  Widget build(BuildContext context) {
    Function sh = sHeight(context);
    Function sw = sWidth(context);

    return Obx(
      () => FYLoader(
        isLoading: widgetCtrl.isLoading.value,
        message: widgetCtrl.loadingMessage.value,
        child: Scaffold(
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
                buildLoginForm(sw, context),
                SizedBox(height: sh(Dimens.k64)),
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
                      onPressed: widgetCtrl.gotoRegistrationScreen,
                      decoration: TextDecoration.underline,
                    ),
                    buttonStyle: whiteTextButtonStyle,
                    buttonTextStyle: context.theme.textTheme.headline3,
                  ),
                ),
              ],
            ),
          ],
        )),
      ),
    );
  }

  Container buildLoginForm(Function sw, BuildContext context) {
    Function sh = sHeight(context);
    Function sw = sWidth(context);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: sw(24.0)),
      height: sh(Dimens.k405),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(Dimens.k12),
        child: Card(
            elevation: 8,
            shadowColor: Color.fromRGBO(0, 99, 247, 0.2),
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: sw(27.0)),
              children: [
                SizedBox(height: sh(Dimens.k26)),
                Text(
                  "Sign In",
                  textAlign: TextAlign.center,
                  style: context.theme.textTheme.headline1!
                      .copyWith(fontSize: sh(Dimens.k24)),
                ),
                SizedBox(height: sh(Dimens.k8)),
                Text(
                  "Welcome back, please sign into your account",
                  textAlign: TextAlign.center,
                  style: context.theme.textTheme.headline4!
                      .copyWith(fontSize: sh(Dimens.k12)),
                ),
                SizedBox(height: sh(Dimens.k22)),
                PrimaryTextField(
                  hintText: "johndoe20@gmail.com",
                  labelText: "Email",
                  controller: widgetCtrl.emailTextCtrl,
                  errorMessage: widgetCtrl.emailError.value,
                  onChanged: widgetCtrl.clearEmailError,
                ),
                SizedBox(height: sh(Dimens.k12)),
                PrimaryTextField(
                  hintText: "****************",
                  labelText: "Password",
                  controller: widgetCtrl.passwordTextCtrl,
                  errorMessage: widgetCtrl.passwordError.value,
                  obscureText: widgetCtrl.obscurePassword.value,
                  onChanged: widgetCtrl.clearPasswordError,
                  suffixIcon: FYButton(
                      onTap: widgetCtrl.toggleObscurePassword,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: sw(16.0)),
                        child: widgetCtrl.obscurePassword.value
                            ? Icon(Feather.eye_off)
                            : Icon(Feather.eye),
                      )),
                ),
                SizedBox(height: sh(Dimens.k26)),
                Center(
                  child: LocalTheme(
                    child: FYTextButton(
                      text: "Sign in",
                      onPressed: widgetCtrl.validateInputs,
                    ),
                    buttonStyle: mainTextButtonStyle.copyWith(
                        minimumSize: MaterialStateProperty.all<Size>(
                            Size(sw(Dimens.k327), sh(Dimens.k57)))),
                  ),
                ),
                Center(
                  child: LocalTheme(
                    child: FYTextButton(
                      text: "forgot password?",
                      onPressed: widgetCtrl.gotoForgotPasswordScreen,
                      fontStyle: FontStyle.italic,
                    ),
                    buttonStyle: whiteTextButtonStyle,
                    buttonTextStyle: context.theme.textTheme.headline3,
                  ),
                ),
                SizedBox(height: sh(10)),
              ],
            )),
      ),
    );
  }
}
