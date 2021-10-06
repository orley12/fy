import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_yours_customer/resources/Images.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class AddressItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Function sh = sHeight(context);
    final Function sw = sWidth(context);

    return Container(
      width: sw(327),
      height: sh(64),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      padding: EdgeInsets.symmetric(horizontal: sw(12), vertical: sh(12)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildCreditDebitLogo(context, sh),
          SizedBox(width: sw(12)),
          Expanded(
            child: Column(
              children: [
                buildTransactionDetailAndPriceRow(context, sh, sw),
                SizedBox(height: sh(6)),
                buildDateAndTransactionCategoryRow(context, sh)
              ],
            ),
          ),
        ],
      ),
    );
  }

  Row buildDateAndTransactionCategoryRow(BuildContext context, Function sh) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("23 Barnawa, Kaduna Nigeria.", style: context.theme.textTheme.caption!.copyWith(fontSize: sh(12))),
      ],
    );
  }

  Row buildTransactionDetailAndPriceRow(BuildContext context, Function sh, Function sw) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("My Home",
            style: context.theme.textTheme.caption!
                .copyWith(fontSize: sh(Dimens.k12), fontWeight: FontWeight.w600, color: FYColors.darkerBlack2)),
        SvgPicture.asset(Images.pen_2, width: sw(16), height: sh(16), color: FYColors.lighterBlack2),
      ],
    );
  }

  Widget buildCreditDebitLogo(BuildContext context, Function sh) {
    return Transform.scale(
      scale: 1.2,
      child: Radio(
        value: "",
        groupValue: "",
        onChanged: (value) {},
        activeColor: Colors.black,
      ),
    );
  }
}
