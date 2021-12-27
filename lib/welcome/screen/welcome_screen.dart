import 'package:flutter/material.dart';
import 'package:food_yours_customer/common/widget/button/fy_text_button.dart';
import 'package:food_yours_customer/common/widget/text/mulish_400_text.dart';
import 'package:food_yours_customer/resources/Images.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:food_yours_customer/welcome/controller/welcome_screen_controller.dart';
import 'package:food_yours_customer/welcome/widget/welcome_screen_title.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';

class WelcomeScreen extends StatelessWidget {
  final WelcomeScreenController widgetController =
      Get.put(WelcomeScreenController());

  @override
  Widget build(BuildContext context) {
    final Function sh = sHeight(context);
    final Function sw = sWidth(context);

    return Scaffold(
      body: Container(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Obx(
              () => AnimatedSlide(
                duration: Duration(seconds: 1),
                offset: widgetController.slideOffset.value,
                curve: Curves.bounceOut,
                child: Image.asset(Images.welcome_screen_img,
                    height: sh(455), width: double.infinity, fit: BoxFit.fill),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: sw(Dimens.k24)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: sh(Dimens.k32),
                  ),
                  WelcomeScreenTitle(),
                  SizedBox(
                    height: sh(Dimens.k32),
                  ),
                  Mulish400Text(
                    text: "Explore great dishes in your locality.",
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: sh(Dimens.k32),
                  ),
                  FYTextButton(
                    text: "Register",
                    onPressed: widgetController.gotoRegistrationScreen,
                  ),
                  SizedBox(
                    height: sh(Dimens.k24),
                  ),
                  FYTextButton(
                    text: "Sign in",
                    textColor: FYColors.mainRed,
                    backgroundColor: FYColors.subtleRed3,
                    onPressed: widgetController.gotoLoginScreen,
                  ),
                  SizedBox(
                    height: sh(20),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
