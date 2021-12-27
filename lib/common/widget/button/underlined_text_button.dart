import 'package:flutter/material.dart';
import 'package:food_yours_customer/common/widget/button/fy_flat_button.dart';
import 'package:food_yours_customer/common/widget/text/mulish_700_text.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';

class UnderlinedTextButton extends StatelessWidget {
  final String text;
  final Function()? onPressed;

  const UnderlinedTextButton({
    Key? key,
    required this.text,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FYFlatButton(
      size: Size(double.infinity, Dimens.k56),
      child: Mulish700Text(
        text: text,
        color: FYColors.mainRed,
        textDecoration: TextDecoration.underline,
      ),
      onPressed: onPressed,
    );
  }
}
