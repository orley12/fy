import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/resources/icons.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class FYChip extends StatelessWidget {
  final String text;
  final Color? backgroundColor;
  final Color? textColor;
  final bool hideDeleteButton;

  FYChip(this.text, {this.backgroundColor, this.textColor, this.hideDeleteButton = true});

  @override
  Widget build(BuildContext context) {
    final Function sh = sHeight(context);
    final Function sw = sWidth(context);

    return Chip(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        backgroundColor: backgroundColor,
        label: SizedBox(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: sw(50),
                child: AutoSizeText(text.substring(0, text.length >= 10 ? 11 : text.length),
                    minFontSize: 4,
                    style: context.theme.textTheme.headline3!
                        .copyWith(fontSize: Dimens.k12, fontWeight: FontWeight.w600, color: textColor ?? FYColors.mainBlue)),
              ),
              hideDeleteButton
                  ? Container()
                  : Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [SizedBox(width: sw(7.0)), Icon(FYIcons.x, size: Dimens.k16)],
                    ),
            ],
          ),
        ));
  }
}
