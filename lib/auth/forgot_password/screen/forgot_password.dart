import 'package:flutter/material.dart';
import 'package:food_yours_customer/auth/forgot_password/controller/forgot_password_screen_controller.dart';
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

class ForgetPasswordScreen extends StatelessWidget {
  final ForgetPasswordScreenController widgetCtrl =
      Get.put(ForgetPasswordScreenController());

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
                  _buildResetPasswordForm(sw, context),
                  SizedBox(height: sh(Dimens.k40)),
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
                        onPressed: widgetCtrl.validateInput,
                        decoration: TextDecoration.underline,
                      ),
                      buttonStyle: whiteTextButtonStyle,
                      buttonTextStyle: context.theme.textTheme.headline3,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container _buildResetPasswordForm(Function sw, BuildContext context) {
    Function sh = sHeight(context);
    Function sw = sWidth(context);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: sw(Dimens.k24)),
      height: Dimens.k308,
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
                  "Forgot Password",
                  textAlign: TextAlign.center,
                  style: context.theme.textTheme.headline1!
                      .copyWith(fontSize: sh(Dimens.k24)),
                ),
                SizedBox(height: sh(Dimens.k8)),
                Text(
                  "We will send an email to reset your password",
                  textAlign: TextAlign.center,
                  style: context.theme.textTheme.headline4!
                      .copyWith(fontSize: sh(Dimens.k12)),
                ),
                SizedBox(height: sh(Dimens.k26)),
                Obx(() => PrimaryTextField(
                      hintText: "johndoe20@gmail.com",
                      labelText: "Email",
                      controller: widgetCtrl.emailTextCtrl,
                      onChanged: widgetCtrl.clearEmailError,
                      errorMessage: widgetCtrl.emailError.value,
                    )),
                SizedBox(height: sh(Dimens.k40)),
                Center(
                  child: FYTextButton(
                    text: "Send Recovery Email",
                    onPressed: widgetCtrl.validateInput,
                  ),
                ),
                SizedBox(height: sh(Dimens.k40)),
              ],
            )),
      ),
    );
  }
}
