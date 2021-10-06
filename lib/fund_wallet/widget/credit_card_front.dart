import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_yours_customer/resources/Images.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class CreditCardFront extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Function sh = sHeight(context);
    final Function sw = sWidth(context);

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Debit.",
                    style: context.theme.textTheme.caption!
                        .copyWith(fontSize: sh(8.53), fontWeight: FontWeight.w700, color: Colors.white)),
                Column(crossAxisAlignment: CrossAxisAlignment.end, mainAxisSize: MainAxisSize.min, children: [
                  Text("Bank Name",
                      style: context.theme.textTheme.caption!
                          .copyWith(fontSize: sh(14.28), fontWeight: FontWeight.w700, color: Colors.white)),
                  Text("& Logo",
                      style: context.theme.textTheme.caption!
                          .copyWith(fontSize: sh(7.9), fontWeight: FontWeight.w700, color: Colors.white)),
                ]),
              ],
            ),
          ),
          SizedBox(height: sh(10.79)),
          Expanded(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [SvgPicture.asset(Images.card_chip, width: sw(23.82), height: sh(18.3))]),
          ),
          SizedBox(height: sh(4.59)),
          Text("5355   0348   5945   5045",
              style: context.theme.textTheme.caption!
                  .copyWith(fontSize: sh(17.07), fontWeight: FontWeight.w700, color: Colors.white)),
          SizedBox(height: sh(4.25)),
          Row(
            children: [
              Text(
                  "VALID\n"
                  "THRU",
                  style: context.theme.textTheme.caption!
                      .copyWith(fontSize: sh(4.67), fontWeight: FontWeight.w600, color: Colors.white)),
              SizedBox(width: sh(5.69)),
              Text("12/24",
                  style: context.theme.textTheme.caption!
                      .copyWith(fontSize: sh(8.53), fontWeight: FontWeight.w600, color: Colors.white)),
            ],
          ),
          SizedBox(height: sh(7.18)),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text("SAMPLE NAME HERE",
                    style: context.theme.textTheme.caption!
                        .copyWith(fontSize: sh(8.5), fontWeight: FontWeight.w700, color: Colors.white)),
                SizedBox(width: sh(5.69)),
                Text(
                    "CARD\n"
                    "TYPE",
                    style: context.theme.textTheme.caption!
                        .copyWith(fontSize: sh(10.95), fontWeight: FontWeight.w800, color: Colors.white)),
              ],
            ),
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(vertical: sh(9.92), horizontal: sw(19.85)),
      height: sh(166.21),
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          gradient: LinearGradient(
            stops: [0.3, 7],
            colors: [Color(0xFF03045E), Color(0xFF03045E).withOpacity(0.5)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )),
    );
  }
}

class CreditCardBack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Function sh = sHeight(context);
    final Function sw = sWidth(context);

    return Container(
      padding: EdgeInsets.symmetric(vertical: sh(9.92), horizontal: sw(19.85)),
      height: sh(166.21),
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          gradient: LinearGradient(
            stops: [0.3, 7],
            colors: [Color(0xFF03045E), Color(0xFF03045E).withOpacity(0.5)],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          )),
    );
  }
}
