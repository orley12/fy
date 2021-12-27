import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_icons/flutter_icons.dart';
import 'package:food_yours_customer/common/widget/button/fy_icon_button.dart';

class TextObscureButton extends StatelessWidget {
  final Function() onPressed;
  final bool isObscured;

  const TextObscureButton({
    Key? key,
    required this.onPressed,
    this.isObscured = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FYIconButton(
      onPressed: onPressed,
      icon: isObscured ? Feather.eye_off : Feather.eye,
    );
  }
}
