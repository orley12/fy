import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_yours_customer/common/widget/app_button.dart';
import 'package:food_yours_customer/resources/Images.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/resources/icons.dart';
import 'package:food_yours_customer/util/navigation_util.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class SecondaryAppBar extends StatelessWidget {
  final bool? showBackBtn;
  final String title;
  final double? elevation;
  final Function()? backAction;

  SecondaryAppBar({this.showBackBtn = true, required this.title, this.elevation = 8.0, this.backAction});
  @override
  Widget build(BuildContext context) {
    Function sh = sHeight(context);
    Function sw = sHeight(context);

    return AppBar(
      backgroundColor: FYColors.lighterBlack2,
      title: Text(
        title,
        style:
            context.theme.textTheme.caption!.copyWith(fontSize: sh(Dimens.k16), fontWeight: FontWeight.w700, color: Colors.white),
      ),
      leading: FYButton(
        child: Container(
            padding: EdgeInsets.only(left: sw(24)), child: SvgPicture.asset(Images.back, height: sh(40), width: sw(40))),
        onTap: pop,
      ),
      elevation: elevation,
      shadowColor: Color.fromRGBO(0, 99, 247, 0.1),
      foregroundColor: Colors.white,
    );
  }
}
