import 'package:flutter/material.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';

class AuthCard extends StatelessWidget {
  final double height;
  final Widget child;

  const AuthCard({
    Key? key,
    required this.height,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Function sw = sWidth(context);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: sw(Dimens.k26_94)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(Dimens.k12),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 99, 247, 0.2).withOpacity(0.03),
            spreadRadius: 5,
            blurRadius: 2,
            offset: const Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      height: height,
      child: child,
    );
  }
}
