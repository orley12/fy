import 'package:flutter/material.dart';
import 'package:food_yours_customer/common/widget/app_button.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/resources/icons.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class ProfileOptionItem extends StatelessWidget {
  final Widget? trailing;
  final String leading;
  final Function()? onPressed;

  ProfileOptionItem({required this.onPressed, this.trailing, required this.leading});

  @override
  Widget build(BuildContext context) {
    final Function sh = sHeight(context);
    final Function sw = sWidth(context);

    return FYButton(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: sw(15.95)),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(4), color: Colors.white),
        height: sh(48),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              leading,
              style: context.theme.textTheme.headline2!.copyWith(fontSize: sh(Dimens.k14)),
            ),
            trailing ?? Icon(FYIcons.chevron_right, color: FYColors.darkerBlack2, size: sh(18))
          ],
        ),
      ),
    );
  }
}
