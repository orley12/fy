import 'package:flutter/material.dart';
import 'package:food_yours_customer/common/widget/food_yours_logo.dart';
import 'package:food_yours_customer/resources/Images.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Function sh = sHeight(context);
    Function sw = sWidth(context);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(Images.splash_screen_bg_img),
                fit: BoxFit.fill)),
        child: Center(
            child: FYLogo(
                svgPath: Images.food_yours_logo,
                height: sh(45),
                width: sw(218.7))),
      ),
    );
  }
}
