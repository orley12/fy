import 'package:flutter/material.dart';
import 'package:food_yours_customer/common/widget/text/mulish_400_text.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class FYOutlinedButton extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  final Size size;
  final double textSize;
  final Color backgroundColor;
  final Color textColor;

  const FYOutlinedButton({
    Key? key,
    required this.text,
    this.size = const Size(double.infinity, Dimens.k56),
    this.onPressed,
    this.textSize = Dimens.k14,
    this.backgroundColor = FYColors.mainRed,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      child: Mulish400Text(
        text: text,
        fontSize: textSize,
        color: textColor,
      ),
      style: context.theme.outlinedButtonTheme.style!.copyWith(
        minimumSize: MaterialStateProperty.all<Size>(size),
        backgroundColor: MaterialStateProperty.all<Color>(backgroundColor),
        side: MaterialStateProperty.all<BorderSide>(
            BorderSide(color: Colors.white, width: Dimens.k0_5)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0))),
      ),
    );
  }
}
