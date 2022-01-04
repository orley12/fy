import 'package:flutter/material.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class FYFlatButton extends StatelessWidget {
  final Widget child;
  final Function()? onPressed;
  final Color backgroundColor;
  final Size size;
  final EdgeInsets padding;

  const FYFlatButton({
    Key? key,
    required this.child,
    this.onPressed,
    this.backgroundColor = Colors.white,
    this.size = const Size(double.infinity, Dimens.k56),
    this.padding = const EdgeInsets.all(Dimens.k8),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: child,
      style: context.theme.textButtonTheme.style!.copyWith(
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(padding),
        minimumSize: MaterialStateProperty.all<Size>(size),
        backgroundColor: MaterialStateProperty.all<Color>(backgroundColor),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0))),
      ),
    );
  }
}
