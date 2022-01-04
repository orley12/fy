import 'package:flutter/material.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class DeliveryDaysText extends StatelessWidget {
  final String deliveryDays;

  const DeliveryDaysText({
    Key? key,
    required this.deliveryDays,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Function sh = sHeight(context);

    return RichText(
      textAlign: TextAlign.start,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
            style: context.theme.textTheme.headline3!.copyWith(
              color: FYColors.lighterBlack2,
              fontSize: sh(Dimens.k12),
            ),
            text: "DD: ",
          ),
          TextSpan(
            style: context.theme.textTheme.headline3!.copyWith(
              color: FYColors.mainBlue,
              fontSize: sh(Dimens.k12),
            ),
            text: deliveryDays,
          ),
        ],
      ),
    );
  }
}
