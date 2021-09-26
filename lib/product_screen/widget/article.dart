import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class Article extends StatelessWidget {
  final String title;
  final String description;
  final double? titleFontSize;
  final double? descriptionFontSize;
  final double? spaceBetween;

  Article(
      {this.title = "", this.description = "", this.titleFontSize = 16, this.descriptionFontSize = 16, this.spaceBetween = 4});

  @override
  Widget build(BuildContext context) {
    final Function sh = sHeight(context);
    final Function sw = sWidth(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: context.theme.textTheme.headline2!.copyWith(fontSize: sh(titleFontSize ?? Dimens.k16))),
        SizedBox(height: sh(spaceBetween ?? Dimens.k4)),
        SizedBox(
          width: sw(275),
          child: AutoSizeText(description,
              style: context.theme.textTheme.headline4!.copyWith(fontSize: sh(descriptionFontSize ?? Dimens.k16))),
        ),
      ],
    );
  }
}
