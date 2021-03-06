import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/resources/font_family.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/route_manager.dart';

TextStyle textStyleH6 = TextStyle(
  color: FYColors.mainBlack,
  fontWeight: FontWeight.w700,
  fontFamily: FontFamily.inter,
);

TextStyle textStyleH1 = TextStyle(
  color: FYColors.mainBlack,
  fontWeight: FontWeight.w700,
  fontFamily: FontFamily.inter,
);

TextStyle textStyleH2 = TextStyle(
  color: FYColors.mainBlack,
  fontWeight: FontWeight.w700,
  fontFamily: FontFamily.mulish,
);

TextStyle textStyleH3 = TextStyle(
  color: FYColors.mainRed,
  fontWeight: FontWeight.w700,
  fontFamily: FontFamily.mulish,
);

TextStyle textStyleH4 = TextStyle(
  color: FYColors.darkerBlack,
  fontWeight: FontWeight.w400,
  fontFamily: FontFamily.mulish,
);

TextStyle textStyleH5 = TextStyle(
  color: FYColors.darkerBlack2,
  fontWeight: FontWeight.w400,
  fontFamily: FontFamily.mulish,
);

TextStyle bodyStyle1 = TextStyle(
  color: FYColors.mainBlack,
  fontWeight: FontWeight.w400,
  fontFamily: FontFamily.mulish,
);

TextStyle bodyStyle2 = TextStyle(
  color: FYColors.mainBlack,
  fontWeight: FontWeight.w400,
  fontFamily: FontFamily.mulish,
);

TextStyle display2 = TextStyle(
  color: FYColors.mainBlack,
  fontWeight: FontWeight.w300,
  fontFamily: FontFamily.mulish,
);

TextStyle leadParagraph = TextStyle(
  color: FYColors.mainBlack,
  fontWeight: FontWeight.w400,
  fontFamily: FontFamily.mulish,
);

TextStyle labelText = TextStyle(
  color: FYColors.mainBlack,
  fontWeight: FontWeight.w400,
  fontFamily: FontFamily.mulish,
);

TextStyle buttonTextStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.w400,
  fontFamily: FontFamily.mulish,
);

ButtonStyle mainTextButtonStyle = ButtonStyle(
  minimumSize: MaterialStateProperty.all<Size>(Size(Dimens.k327, Dimens.k57)),
  backgroundColor: MaterialStateProperty.all<Color>(FYColors.mainRed),
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0))),
);

ButtonStyle mainOutlineButtonStyle = ButtonStyle(
  minimumSize: MaterialStateProperty.all<Size>(Size(Dimens.k98, Dimens.k32)),
  backgroundColor: MaterialStateProperty.all<Color>(FYColors.mainRed),
  side: MaterialStateProperty.all<BorderSide>(
      BorderSide(color: Colors.white, width: Dimens.k2)),
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0))),
);

ButtonStyle subTextButtonStyle = mainTextButtonStyle.copyWith(
  backgroundColor: MaterialStateProperty.all<Color>(FYColors.subtleRed),
);

ButtonStyle whiteTextButtonStyle = mainTextButtonStyle.copyWith(
  backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
);

TextStyle hintTextStyle = TextStyle(
  color: FYColors.subtleBlack2,
  fontWeight: FontWeight.w400,
  fontSize: Dimens.k12,
  fontFamily: FontFamily.mulish,
);

TextStyle labelTextStyle = TextStyle(
  color: FYColors.lighterBlack2,
  fontWeight: FontWeight.w400,
  fontSize: Dimens.k12,
  fontFamily: FontFamily.mulish,
);

TextStyle errorStyle = TextStyle(
  color: FYColors.lighterOrange,
  fontWeight: FontWeight.w400,
  fontSize: Dimens.k12,
  fontFamily: FontFamily.mulish,
);

UnderlineInputBorder errorBoarderStyle = UnderlineInputBorder(
    borderSide: BorderSide(
  color: FYColors.lighterOrange,
  width: 1,
));

UnderlineInputBorder focusedBoarderStyle = UnderlineInputBorder(
    borderSide: BorderSide(
  color: FYColors.lighterRed,
  width: 1,
));
