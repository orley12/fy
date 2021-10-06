import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class PaymentMethodCard extends StatelessWidget {
  final Widget cardTitle;
  final TextSpan cardKeyText;
  final TextSpan cardValueText;
  final bool isImage;

  PaymentMethodCard({required this.cardTitle, required this.cardValueText, required this.cardKeyText, this.isImage = false});

  @override
  Widget build(BuildContext context) {
    final Function sh = sHeight(context);
    final Function sw = sWidth(context);

    return Expanded(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(Dimens.k12),
        child: Card(
          elevation: 0,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: sw(8), vertical: sh(4.75)),
            height: sh(74),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                    alignment: Alignment.topRight,
                    child: Icon(
                      Icons.check_circle,
                      size: 12,
                      color: FYColors.darkerBlack4,
                    )),
                SizedBox(height: sh(4.75)),
                cardTitle,
                SizedBox(height: sh(isImage ? 0 : 8)),
                isImage
                    ? AutoSizeText("Paystack",
                        style: context.theme.textTheme.caption!
                            .copyWith(fontSize: sh(Dimens.k16), fontWeight: FontWeight.w700, color: FYColors.subtleBlue5))
                    : RichText(
                        textAlign: TextAlign.start,
                        text: TextSpan(children: <TextSpan>[
                          cardValueText,
                          cardKeyText,
                        ]),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
