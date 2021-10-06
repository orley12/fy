import 'package:flutter/material.dart';
import 'package:food_yours_customer/all_address/screen/all_address_screen.dart';
import 'package:food_yours_customer/bank_details/screen/bank_details.dart';
import 'package:food_yours_customer/change_password/screen/change_password_screen.dart';
import 'package:food_yours_customer/common/widget/fy_switch.dart';
import 'package:food_yours_customer/legal/screen/legal_screen.dart';
import 'package:food_yours_customer/new_address/screen/new_address.dart';
import 'package:food_yours_customer/partner_with_us/screen/partner_with_us_screen.dart';
import 'package:food_yours_customer/person_details/screen/person_details.dart';
import 'package:food_yours_customer/profile/controller/profile_tab_controller.dart';
import 'package:food_yours_customer/profile/widget/profile_app_bar.dart';
import 'package:food_yours_customer/profile/widget/profile_option_item.dart';
import 'package:food_yours_customer/profile/widget/wallet_balance.dart';
import 'package:food_yours_customer/referal_loyalty/screen/referral_loyalty.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/support/screen/support_screen.dart';
import 'package:food_yours_customer/transaction_history/screen/transaction_history_screen.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:get/instance_manager.dart';

class ProfileTab extends StatelessWidget {
  final ProfileTabController widgetCtrl = Get.put(ProfileTabController());

  @override
  Widget build(BuildContext context) {
    final Function sh = sHeight(context);
    final Function sw = sWidth(context);

    return Container(
      color: FYColors.subtleBlack5,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: FYColors.subtleBlack5,
          appBar: PreferredSize(preferredSize: Size(20, sh(50.41)), child: ProfileAppBar()),
          body: ListView(
            padding: EdgeInsets.symmetric(horizontal: sw(24)),
            children: [
              WalletBalance(),
              SizedBox(height: sh(24)),
              ProfileOptionItem(
                  leading: "Personal Details", onPressed: () => widgetCtrl.onOptionSelected(PersonalDetailsScreen())),
              SizedBox(height: sh(12)),
              ProfileOptionItem(leading: "Bank Details", onPressed: () => widgetCtrl.onOptionSelected(BankDetailsScreen())),
              SizedBox(height: sh(12)),
              ProfileOptionItem(leading: "My Addresses", onPressed: () => widgetCtrl.onOptionSelected(AllAddressesScreen())),
              SizedBox(height: sh(12)),
              ProfileOptionItem(
                  leading: "Notification",
                  onPressed: () => widgetCtrl.onOptionSelected(Container()),
                  trailing: Transform.scale(
                      scale: 0.65,
                      child: FYSwitch(
                        onChanged: widgetCtrl.toggleNotification,
                        value: widgetCtrl.enableNotification.value,
                        activeWidget: Icon(Icons.check, size: sh(24), color: context.theme.backgroundColor),
                        inactiveWidget: Container(width: sw(24)),
                        inactiveColor: Color(0XFFF4F4F4),
                        switchCircleColor: Color(0XFFBABABA),
                      ))),
              SizedBox(height: sh(12)),
              ProfileOptionItem(
                  leading: "Transaction History", onPressed: () => widgetCtrl.onOptionSelected(TransactionHistoryScreen())),
              SizedBox(height: sh(12)),
              ProfileOptionItem(leading: "Change Password", onPressed: () => widgetCtrl.onOptionSelected(ChangePasswordScreen())),
              SizedBox(height: sh(12)),
              ProfileOptionItem(
                  leading: "Referral and Loyalty", onPressed: () => widgetCtrl.onOptionSelected(ReferralAndLoyaltyScreen())),
              SizedBox(height: sh(12)),
              ProfileOptionItem(leading: "Become A Partner", onPressed: () => widgetCtrl.onOptionSelected(PartnerWithUsScreen())),
              SizedBox(height: sh(12)),
              ProfileOptionItem(leading: "Support", onPressed: () => widgetCtrl.onOptionSelected(SupportScreen())),
              SizedBox(height: sh(12)),
              ProfileOptionItem(leading: "Legal", onPressed: () => widgetCtrl.onOptionSelected(LegalScreen())),
              SizedBox(height: sh(16)),
              Text("Joined January 6, 2021", style: context.theme.textTheme.caption!.copyWith(fontSize: sh(12))),
              SizedBox(height: sh(50)),
            ],
          ),
        ),
      ),
    );
  }
}
