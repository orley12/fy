import 'package:flutter/material.dart';
import 'package:food_yours_customer/bank_details/controller/bank_details_screen_controller.dart';
import 'package:food_yours_customer/common/widget/input_field_wrapper.dart';
import 'package:food_yours_customer/common/widget/secondary_app_bar.dart';
import 'package:food_yours_customer/common/widget/secondary_text_input_field.dart';
import 'package:food_yours_customer/common/widget/text_button.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:get/instance_manager.dart';

class BankDetailsScreen extends StatelessWidget {
  final BankDetailsScreenController widgetCtrl = Get.put(BankDetailsScreenController());
  @override
  Widget build(BuildContext context) {
    final Function sh = sHeight(context);
    final Function sw = sWidth(context);

    return Container(
      color: context.theme.backgroundColor,
      child: Scaffold(
        backgroundColor: FYColors.subtleBlack5,
        appBar: PreferredSize(preferredSize: Size(sw(20), sh(46.41)), child: SecondaryAppBar(title: "Bank Details")),
        body: ListView(padding: EdgeInsets.symmetric(horizontal: sw(24), vertical: sh(24)), children: [
          InputFieldWrapper(
            labelText: "Account Name",
            child: SecondaryTextField(hintText: "John", hintTextColor: FYColors.subtleBlack),
          ),
          SizedBox(height: sh(16)),
          InputFieldWrapper(
            labelText: "Account Number",
            child: SecondaryTextField(hintText: "0000000000", hintTextColor: FYColors.subtleBlack),
          ),
          SizedBox(height: sh(16)),
          InputFieldWrapper(
            labelText: "Bank",
            child: SecondaryTextField(hintText: "Access Bank Plc", hintTextColor: FYColors.subtleBlack),
          ),
          SizedBox(height: sh(16)),
          InputFieldWrapper(
            labelText: "Enter Password",
            child: SecondaryTextField(hintText: "***********", hintTextColor: FYColors.subtleBlack),
          ),
          SizedBox(height: sh(24)),
          FYTextButton(text: "Save and Close", onPressed: widgetCtrl.gotoNextScreen),
        ]),
      ),
    );
  }
}
