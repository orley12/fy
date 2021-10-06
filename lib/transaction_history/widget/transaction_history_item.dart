import 'package:flutter/material.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class TransactionHistoryItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Function sh = sHeight(context);
    final Function sw = sWidth(context);

    return Container(
      color: Colors.white,
      width: sw(327),
      height: sh(64),
      padding: EdgeInsets.symmetric(horizontal: sw(12), vertical: sh(12)),
      child: Row(
        children: [
          Container(
            width: sw(40),
            height: sh(40),
            decoration: BoxDecoration(color: FYColors.subtleGreen2, borderRadius: BorderRadius.circular(50)),
            child: buildCreditDebitLogo(context, sh),
          ),
          SizedBox(width: sw(12)),
          Expanded(
            child: Column(
              children: [
                buildTransactionDetailAndPriceRow(context, sh),
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
        Text("johndoe@google.com", style: context.theme.textTheme.caption!.copyWith(fontSize: sh(12))),
        Text("Debit", style: context.theme.textTheme.caption!.copyWith(fontSize: sh(12))),
      ],
    );
  }

  Row buildTransactionDetailAndPriceRow(BuildContext context, Function sh) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Wallet Top-up",
            style: context.theme.textTheme.caption!
                .copyWith(fontSize: sh(Dimens.k12), fontWeight: FontWeight.w600, color: FYColors.darkerBlack2)),
        Text("N 95,500",
            style: context.theme.textTheme.caption!
                .copyWith(fontSize: sh(Dimens.k12), fontWeight: FontWeight.w700, color: FYColors.mainGreen)),
      ],
    );
  }

  Center buildCreditDebitLogo(BuildContext context, Function sh) {
    return Center(
      child: Text("CR",
          style: context.theme.textTheme.caption!
              .copyWith(fontSize: sh(Dimens.k16), fontWeight: FontWeight.w800, color: FYColors.mainGreen)),
    );
  }
}
