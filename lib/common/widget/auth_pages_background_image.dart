import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_yours_customer/resources/Images.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';

class AuthPagesBackgroundImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Function sh = sHeight(context);

    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: sh(Dimens.k70)),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SvgPicture.asset(Images.registration_pattern_design),
            ],
          ),
        ],
      ),
    );
  }
}
