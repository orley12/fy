import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_yours_customer/common/widget/input_field_wrapper.dart';
import 'package:food_yours_customer/common/widget/local_theme.dart';
import 'package:food_yours_customer/common/widget/secondary_app_bar.dart';
import 'package:food_yours_customer/common/widget/text_button.dart';
import 'package:food_yours_customer/referal_loyalty/widget/social_media_button.dart';
import 'package:food_yours_customer/resources/Images.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class ReferralAndLoyaltyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Function sh = sHeight(context);
    final Function sw = sWidth(context);

    return Container(
      color: context.theme.backgroundColor,
      child: Scaffold(
        backgroundColor: FYColors.subtleBlack5,
        appBar: PreferredSize(preferredSize: Size(sw(20), sh(46.41)), child: SecondaryAppBar(title: "Personal Details")),
        body: ListView(padding: EdgeInsets.symmetric(horizontal: sw(24), vertical: sh(24)), children: [
          Text("Loyalty Points",
              style: context.theme.textTheme.headline4!.copyWith(fontSize: sh(Dimens.k16), fontWeight: FontWeight.w700)),
          SizedBox(height: sh(4)),
          Text("21", style: context.theme.textTheme.headline4!.copyWith(fontSize: sh(Dimens.k40), fontWeight: FontWeight.w700)),
          SizedBox(height: sh(4)),
          Text("Earn 1% cashback (loyalty points) every time you place an order, you can use this to order meal if enough.",
              style: context.theme.textTheme.headline4!.copyWith(fontSize: sh(Dimens.k12))),
          SizedBox(height: sh(48)),
          Text("Referral",
              style: context.theme.textTheme.headline4!.copyWith(fontSize: sh(Dimens.k16), fontWeight: FontWeight.w700)),
          SizedBox(height: sh(8)),
          Text(
              "Refer and Earn loyalty points worth 1% of your invitee's first purchase when they register on Foodyours with your referral ID.",
              style: context.theme.textTheme.headline4!.copyWith(fontSize: sh(Dimens.k12))),
          SizedBox(height: sh(28)),
          InputFieldWrapper(
            labelText: "Referral link",
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: sw(16), vertical: sh(12)),
              decoration: BoxDecoration(
                border: Border.all(color: FYColors.lighterBlack2, width: 0.5),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("MySNHI3Qt5zQlR/FoodYours",
                      style: context.theme.textTheme.headline4!.copyWith(fontSize: sh(Dimens.k12), color: FYColors.darkerBlack2)),
                  SvgPicture.asset(Images.copy)
                ],
              ),
            ),
          ),
          SizedBox(height: sh(24)),
          LocalTheme(
            child: FYTextButton(text: "Share referral link"),
            buttonStyle: context.theme.textButtonTheme.style!.copyWith(
                minimumSize: MaterialStateProperty.all<Size>(Size(sw(133), sh(Dimens.k47))),
                backgroundColor: MaterialStateProperty.all<Color>(FYColors.lighterBlack2)),
            buttonTextStyle: context.theme.textTheme.button!.copyWith(
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: sh(38)),
          Text("Share on",
              style: context.theme.textTheme.headline4!
                  .copyWith(fontSize: sh(Dimens.k16), color: FYColors.darkerBlack2, fontWeight: FontWeight.w700)),
          SizedBox(height: sh(7)),
          Row(
            children: [
              SocialMediaButton(buttonIcon: Images.facebook, buttonText: "Facebook", buttonThemeColor: FYColors.darkerBlack5),
              SizedBox(width: sw(18)),
              SocialMediaButton(buttonIcon: Images.whatsapp, buttonText: "WhatsApp", buttonThemeColor: FYColors.lighterGreen2),
            ],
          ),
          SizedBox(height: sh(24)),
          Row(
            children: [
              SocialMediaButton(buttonIcon: Images.instagram, buttonText: "Instagram", buttonThemeColor: FYColors.lighterRed2),
              SizedBox(width: sw(18)),
              SocialMediaButton(buttonIcon: Images.twitter, buttonText: "Twitter", buttonThemeColor: FYColors.subtleBlue6),
            ],
          ),
        ]),
      ),
    );
  }
}
