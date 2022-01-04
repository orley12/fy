import 'package:flutter/material.dart';
import 'package:food_yours_customer/resources/dimens.dart';

// This widget converts its child to a button
class FYButton extends StatelessWidget {
  final Widget child;
  final Function()? onTap;
  final FocusNode? focusNode;
  final double padding;

  FYButton({
    required this.child,
    required this.onTap,
    this.focusNode,
    this.padding = Dimens.k8,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        focusNode: focusNode,
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: child,
        ),
      ),
    );
  }
}
