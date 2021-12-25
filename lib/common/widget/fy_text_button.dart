// import 'package:flutter/material.dart';
// import 'package:food_yours_customer/resources/colors.dart';
// import 'package:get/get_utils/src/extensions/context_extensions.dart';

// class BrassTextButton extends StatelessWidget {
//   final String text;
//   final Color backgroundColor;
//   final Color textColor;
//   final double textSize;
//   final Function()? onPressed;
//   final Size size;
//   final TextDecoration textDecoration;

//   const BrassTextButton({
//     Key? key,
//     required this.text,
//     this.onPressed,
//     this.backgroundColor = FYColors.rea,
//     this.textColor = Colors.white,
//     this.textSize = KDimens.k14,
//     this.size = const Size(double.infinity, KDimens.k56),
//     this.textDecoration = TextDecoration.none,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     Function sh = sHeight(context);

//     return TextButton(
//       onPressed: onPressed,
//       child: MediumText(
//         text: text,
//         color: textColor,
//         fontSize: sh(textSize),
//         textDecoration: textDecoration,
//       ),
//       style: context.theme.textButtonTheme.style!.copyWith(
//         minimumSize: MaterialStateProperty.all<Size>(size),
//         backgroundColor: MaterialStateProperty.all<Color>(backgroundColor),
//         shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//             RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0))),
//       ),
//     );
//   }
// }
