import 'package:flutter/material.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/resources/icons.dart';
import 'package:food_yours_customer/util/navigation_util.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class PrimaryAppBar extends StatelessWidget {
  final bool? showBackBtn;
  final String title;
  final double? elevation;
  final Function()? backAction;

  PrimaryAppBar({this.showBackBtn = true, required this.title, this.elevation = 8.0, this.backAction});

  @override
  Widget build(BuildContext context) {
    Function sh = sHeight(context);

    return AppBar(
      backgroundColor: context.theme.backgroundColor,
      title: Text(
        title,
        style: context.theme.textTheme.caption!
            .copyWith(fontSize: sh(Dimens.k16), fontWeight: FontWeight.w700, color: FYColors.darkerBlack2),
      ),
      leading: IconButton(icon: Icon(FYIcons.arrow_left), onPressed: backAction ?? () => pop()),
      elevation: elevation,
      shadowColor: Color.fromRGBO(0, 99, 247, 0.1),
      foregroundColor: FYColors.darkerBlack2,
    );
  }
}
