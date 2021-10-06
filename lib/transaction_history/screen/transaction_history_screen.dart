import 'package:flutter/material.dart';
import 'package:food_yours_customer/common/widget/secondary_app_bar.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/transaction_history/widget/transaction_history_item.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class TransactionHistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Function sh = sHeight(context);
    final Function sw = sWidth(context);

    return Container(
        color: context.theme.backgroundColor,
        child: Scaffold(
          backgroundColor: FYColors.subtleBlack5,
          appBar: PreferredSize(preferredSize: Size(sw(20), sh(46.41)), child: SecondaryAppBar(title: "Transactions")),
          body: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: sw(24), vertical: sh(24)),
            itemBuilder: (BuildContext context, int index) => TransactionHistoryItem(),
            separatorBuilder: (BuildContext context, int index) => SizedBox(height: sh(16)),
            itemCount: 4,
          ),
        ));
  }
}
