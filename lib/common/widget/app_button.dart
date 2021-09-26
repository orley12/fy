import 'package:flutter/material.dart';

// This widget converts its child to a button
class FYButton extends StatelessWidget {
  final Widget child;
  final Function()? onTap;
  FocusNode? focusNode;

  FYButton({required this.child, required this.onTap, this.focusNode});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        focusNode: focusNode,
        onTap: onTap,
        child: child,
      ),
    );
  }
}
