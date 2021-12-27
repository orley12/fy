import 'package:flutter/material.dart';
import 'package:food_yours_customer/common/widget/input_field_wrapper.dart';
import 'package:food_yours_customer/common/widget/local_theme.dart';
import 'package:food_yours_customer/common/widget/secondary_app_bar.dart';
import 'package:food_yours_customer/common/widget/secondary_text_input_field.dart';
import 'package:food_yours_customer/common/widget/text_button.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/style.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:food_yours_customer/wallet_withdrawal/controller/wallet_withdrawal_controller.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:get/instance_manager.dart';

class WalletWithdrawalScreen extends StatelessWidget {
  final WalletWithdrawalScreenController widgetCtrl =
      Get.put(WalletWithdrawalScreenController());

  @override
  Widget build(BuildContext context) {
    final Function sh = sHeight(context);
    final Function sw = sWidth(context);

    return Container(
      color: context.theme.backgroundColor,
      child: Scaffold(
        backgroundColor: FYColors.subtleBlack5,
        appBar: PreferredSize(
            preferredSize: Size(sw(20), sh(46.41)),
            child: SecondaryAppBar(title: "Withdrawal")),
        body: ListView(
            padding: EdgeInsets.symmetric(horizontal: sw(24), vertical: sh(40)),
            children: [
              InputFieldWrapper(
                labelText: "Amount to withdraw",
                child: SecondaryTextField(
                    hintText: "0.00", hintTextColor: FYColors.subtleBlack),
              ),
              SizedBox(height: sh(16)),
              InputFieldWrapper(
                labelText: "Enter Password",
                child: SecondaryTextField(
                    hintText: "John Doe", hintTextColor: FYColors.subtleBlack),
              ),
              SizedBox(height: sh(24)),
              LocalTheme(
                child: FYTextButton(
                  text: "Withdraw Funds",
                  onPressed: widgetCtrl.openAlertDialog,
                ),
                // buttonStyle: whiteTextButtonStyle.copyWith(backgroundColor: MaterialStateProperty.all(FYColors.mainGreen)),
                buttonTextStyle: context.theme.textTheme.headline3!
                    .copyWith(color: Colors.white, fontWeight: FontWeight.w400),
              ),
            ]),
      ),
    );
  }
}
