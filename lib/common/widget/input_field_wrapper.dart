import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class InputFieldWrapper extends StatelessWidget {
  final String labelText;
  final Widget child;
  final Color? labelColor;
  final FontWeight? fontWeight;
  final double? spaceBetween;

  InputFieldWrapper({
    this.labelText = "",
    required this.child,
    this.spaceBetween,
    this.labelColor,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    final sh = sHeight(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(labelText, style: context.theme.textTheme.headline4!.copyWith(fontSize: sh(Dimens.k12))),
        SizedBox(height: sh(spaceBetween ?? sh(2))),
        child,
      ],
    );
  }
}
