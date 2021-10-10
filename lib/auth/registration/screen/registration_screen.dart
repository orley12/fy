import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:food_yours_customer/auth/registration/controller/registration_screen_controller.dart';
import 'package:food_yours_customer/common/widget/app_button.dart';
import 'package:food_yours_customer/common/widget/auth_pages_bacground_image.dart';
import 'package:food_yours_customer/common/widget/food_yours_logo.dart';
import 'package:food_yours_customer/common/widget/fy_country_code_picker.dart';
import 'package:food_yours_customer/common/widget/loader.dart';
import 'package:food_yours_customer/common/widget/local_theme.dart';
import 'package:food_yours_customer/common/widget/text_button.dart';
import 'package:food_yours_customer/common/widget/primary_text_input_field.dart';
import 'package:food_yours_customer/resources/Images.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/resources/style.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:get/instance_manager.dart';

class RegistrationScreen extends StatelessWidget {
  final RegistrationScreenController widgetCtrl = Get.put(RegistrationScreenController());

  @override
  Widget build(BuildContext context) {
    Function sh = sHeight(context, mockupHeight: 914);
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
                    child: FYLogo(svgPath: Images.food_yours_logo),
                  ),
                  SizedBox(height: sh(Dimens.k70)),
                  _buildRegistrationForm(sw, context),
                  SizedBox(height: sh(Dimens.k40)),
                  Text(
                    "Already a user?",
                    textAlign: TextAlign.center,
                    style: context.theme.textTheme.headline5!.copyWith(fontSize: sh(Dimens.k16)),
                  ),
                  // SizedBox(height: sh(Dimens.k16)),
                  Center(
                    child: LocalTheme(
                      child: FYTextButton(
                        text: "Sign in",
                        onPressed: widgetCtrl.gotoLoginScreen,
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

  Container _buildRegistrationForm(Function sw, BuildContext context) {
    Function sh = sHeight(context, mockupHeight: 914);
    Function sw = sWidth(context);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: sw(Dimens.k24)),
      height: sh(Dimens.k568),
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
                  "Register",
                  textAlign: TextAlign.center,
                  style: context.theme.textTheme.headline1!.copyWith(fontSize: sh(Dimens.k24)),
                ),
                SizedBox(height: sh(Dimens.k8)),
                Text(
                  "Welcome, create an account to get started",
                  textAlign: TextAlign.center,
                  style: context.theme.textTheme.headline4!.copyWith(fontSize: sh(Dimens.k12)),
                ),
                SizedBox(height: sh(Dimens.k26)),
                Obx(() => PrimaryTextField(
                      labelText: "First Name",
                      hintText: "John",
                      controller: widgetCtrl.firstNameTextCtrl,
                      errorMessage: widgetCtrl.firstNameError.value,
                      onChanged: widgetCtrl.clearFirstNameError,
                    )),
                SizedBox(height: sh(Dimens.k8)),
                Obx(() => PrimaryTextField(
                      labelText: "Last Name",
                      hintText: "Doe",
                      controller: widgetCtrl.lastNameTextCtrl,
                      errorMessage: widgetCtrl.lastNameError.value,
                      onChanged: widgetCtrl.clearLastNameError,
                    )),
                SizedBox(height: sh(Dimens.k8)),
                Obx(() => Row(
                      children: [
                        SizedBox(
                          width: 85,
                          child: LocalTheme(
                            buttonTextStyle: context.theme.textTheme.bodyText1,
                            bodyStyle2: context.theme.textTheme.bodyText2,
                            child: FYCountryCodePicker(
                              onChanged: widgetCtrl.onCountrySelected,
                              selectedCountryCode: widgetCtrl.selectedCountryCode.value,
                            ),
                          ),
                        ),
                        Expanded(
                          child: PrimaryTextField(
                            labelText: "Phone Number",
                            hintText: "0712 345 6789",
                            controller: widgetCtrl.phoneNumberTextCtrl,
                            errorMessage: widgetCtrl.phoneNumberError.value,
                            onChanged: widgetCtrl.clearPhoneNumberError,
                          ),
                        ),
                      ],
                    )),
                SizedBox(height: sh(Dimens.k8)),
                Obx(() => PrimaryTextField(
                      labelText: "Email",
                      hintText: "johndoe20@gmail.com",
                      controller: widgetCtrl.emailTextCtrl,
                      errorMessage: widgetCtrl.emailError.value,
                      onChanged: widgetCtrl.clearEmailError,
                    )),
                SizedBox(height: sh(Dimens.k8)),
                Obx(() => PrimaryTextField(
                      labelText: "Password",
                      hintText: "****************",
                      controller: widgetCtrl.passwordTextCtrl,
                      errorMessage: widgetCtrl.passwordError.value,
                      obscureText: widgetCtrl.obscurePassword.value,
                      onChanged: widgetCtrl.clearPasswordError,
                      suffixIcon: FYButton(
                          onTap: widgetCtrl.toggleObscurePassword,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: sw(16.0)),
                            child: widgetCtrl.obscurePassword.value ? Icon(Feather.eye_off) : Icon(Feather.eye),
                          )),
                    )),
                SizedBox(height: sh(Dimens.k8)),
                Obx(() => PrimaryTextField(
                      labelText: "Confirm Password",
                      hintText: "****************",
                      controller: widgetCtrl.confirmPasswordTextCtrl,
                      errorMessage: widgetCtrl.confirmPasswordError.value,
                      obscureText: widgetCtrl.obscureConfirmPassword.value,
                      onChanged: widgetCtrl.clearConfirmPasswordError,
                      suffixIcon: FYButton(
                          onTap: widgetCtrl.toggleObscureConfirmPassword,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: sw(16.0)),
                            child: widgetCtrl.obscureConfirmPassword.value ? Icon(Feather.eye_off) : Icon(Feather.eye),
                          )),
                    )),
                SizedBox(height: sh(Dimens.k22)),
                Center(
                  child: FYTextButton(
                    text: "Register",
                    onPressed: widgetCtrl.validateInputs,
                  ),
                ),
                SizedBox(height: sh(Dimens.k21)),
              ],
            )),
      ),
    );
  }
}
