import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class NotificationCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Function sh = sHeight(context);
    Function sw = sWidth(context);

    return ClipRRect(
      borderRadius: BorderRadius.circular(Dimens.k12),
      child: Card(
        elevation: 0,
        child: Container(
          padding: EdgeInsets.only(top: sh(12), bottom: sh(8)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Entypo.dot_single),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Your order has arrived.",
                    style: context.theme.textTheme.caption!.copyWith(
                        fontSize: Dimens.k16,
                        fontWeight: FontWeight.w600,
                        color: FYColors.darkerBlack2),
                  ),
                  SizedBox(height: sh(8)),
                  SizedBox(
                    width: sw(280),
                    child: AutoSizeText(
                        "The courier has arrived with your order and is now waiting for you at the door.",
                        minFontSize: 4,
                        maxLines: 3,
                        style: context.theme.textTheme.headline4!
                            .copyWith(fontSize: sh(Dimens.k12))),
                  ),
                  SizedBox(height: sh(13)),
                  Text(
                    "29/07/2021   05:22PM",
                    style: context.theme.textTheme.caption!.copyWith(
                        fontSize: Dimens.k12,
                        fontWeight: FontWeight.w400,
                        color: FYColors.darkerBlack2),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
