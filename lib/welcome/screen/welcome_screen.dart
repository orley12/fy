import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_yours_customer/common/widget/local_theme.dart';
import 'package:food_yours_customer/common/widget/text_button.dart';
import 'package:food_yours_customer/resources/Images.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/resources/style.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:food_yours_customer/welcome/controller/welcome_screen_controller.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:get/instance_manager.dart';
import 'package:flutter/animation.dart' as animation;

class WelcomeScreen extends StatelessWidget {
  final WelcomeScreenController widgetController = Get.put(WelcomeScreenController());

  @override
  Widget build(BuildContext context) {
    final Function sh = sHeight(context);
    final Function sw = sWidth(context);

    return Scaffold(
      body: Container(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Obx(() => AnimatedSlide(
                  duration: Duration(seconds: 1),
                  offset: widgetController.slideOffset.value,
                  curve: Curves.bounceOut,
                  child: Image.asset(Images.welcome_screen_img, height: sh(455), width: double.infinity, fit: BoxFit.fill),
                )),
            SizedBox(height: sh(Dimens.k32)),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(children: <TextSpan>[
                TextSpan(
                  style: context.theme.textTheme.headline2!.copyWith(fontSize: sh(Dimens.k24)),
                  text: "Discover and order \n quality ",
                ),
                TextSpan(
                  style: context.theme.textTheme.headline3!.copyWith(fontSize: sh(Dimens.k24)),
                  text: "homemade ",
                ),
                TextSpan(
                  style: context.theme.textTheme.headline2!.copyWith(fontSize: sh(Dimens.k24)),
                  text: "meals",
                ),
              ]),
            ),
            SizedBox(height: sh(Dimens.k32)),
            Text(
              "Explore great dishes in your locality.",
              textAlign: TextAlign.center,
              style: context.theme.textTheme.headline4!.copyWith(fontSize: sh(Dimens.k16)),
            ),
            SizedBox(height: sh(Dimens.k32)),
            Center(
              child: FYTextButton(
                text: "Register",
                onPressed: widgetController.gotoRegistrationScreen,
              ),
            ),
            SizedBox(height: sh(Dimens.k24)),
            Center(
              child: LocalTheme(
                child: FYTextButton(
                  text: "Sign in",
                  onPressed: widgetController.gotoLoginScreen,
                ),
                buttonStyle: subTextButtonStyle,
                buttonTextStyle: context.theme.textTheme.headline3!.copyWith(fontSize: sh(Dimens.k16)),
              ),
            ),
            SizedBox(height: sh(20)),
          ],
        ),
      ),
    );
  }
}
