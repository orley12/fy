import 'package:flutter/material.dart';
import 'package:food_yours_customer/common/widget/text/mulish_400_text.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class FYTextButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final double textSize;
  final Function()? onPressed;
  final Size size;
  final TextDecoration textDecoration;
  final FontStyle fontStyle;

  final EdgeInsets padding;

  FYTextButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.backgroundColor = FYColors.mainRed,
    this.textColor = Colors.white,
    this.textSize = Dimens.k16,
    this.size = const Size(double.infinity, Dimens.k56),
    this.textDecoration = TextDecoration.none,
    this.fontStyle = FontStyle.normal,
    this.padding = const EdgeInsets.all(Dimens.k8),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Mulish400Text(
        text: text,
        color: textColor,
        fontSize: textSize,
        textDecoration: textDecoration,
        fontStyle: fontStyle,
      ),
      style: context.theme.textButtonTheme.style!.copyWith(
        padding: MaterialStateProperty.all<EdgeInsets>(padding),
        minimumSize: MaterialStateProperty.all<Size>(size),
        backgroundColor: MaterialStateProperty.all<Color>(backgroundColor),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0))),
      ),
    );
  }
}
