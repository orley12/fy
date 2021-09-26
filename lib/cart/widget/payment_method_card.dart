import 'package:flutter/material.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class PaymentMethodCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Function sh = sHeight(context);
    Function sw = sWidth(context);

    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: FYColors.subtleBlack6, width: 0.4), borderRadius: BorderRadius.circular(Dimens.k12)),
      padding: EdgeInsets.only(left: sw(12), right: sw(12), top: sw(12)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(Dimens.k12),
        child: Card(
          elevation: 0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(alignment: Alignment.topRight, child: Icon(Icons.check_circle, size: 12)),
              Text("My Wallet",
                  style: context.theme.textTheme.caption!
                      .copyWith(fontSize: sh(Dimens.k16), fontWeight: FontWeight.w700, color: FYColors.darkerBlack2)),
              RichText(
                textAlign: TextAlign.start,
                text: TextSpan(children: <TextSpan>[
                  TextSpan(
                    style: context.theme.textTheme.headline4!.copyWith(fontSize: sh(Dimens.k12)),
                    text: "Blc: ",
                  ),
                  TextSpan(
                    style: context.theme.textTheme.caption!
                        .copyWith(fontSize: sh(Dimens.k16), fontWeight: FontWeight.w800, color: FYColors.mainBlue),
                    text: "N22,500",
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
