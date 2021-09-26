import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:food_yours_customer/common/widget/input_field_wrapper.dart';
import 'package:food_yours_customer/common/widget/local_theme.dart';
import 'package:food_yours_customer/common/widget/primary_app_bar.dart';
import 'package:food_yours_customer/common/widget/secondary_text_input_field.dart';
import 'package:food_yours_customer/common/widget/text_button.dart';
import 'package:food_yours_customer/home/widget/home_app_bar.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/resources/style.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class ChangePhoneNumberScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Function sh = sHeight(context);
    Function sw = sWidth(context);

    return Container(
      color: FYColors.subtleBlack5,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: FYColors.subtleBlack5,
          appBar: PreferredSize(preferredSize: Size(20, sh(46.41)), child: PrimaryAppBar(title: "Change Number", elevation: 2.0)),
          body: ListView(
            padding: EdgeInsets.symmetric(horizontal: sw(24)),
            children: [
              SizedBox(height: sh(16)),
              InputFieldWrapper(
                labelText: "Enter New Phone Number",
                child: SecondaryTextField(hintText: "07123456789", hintTextColor: FYColors.subtleBlack),
              ),
              SizedBox(height: sh(16)),
              InputFieldWrapper(
                labelText: "Enter Password",
                child: SecondaryTextField(hintText: "*************", hintTextColor: FYColors.subtleBlack),
              ),
              SizedBox(height: sh(24)),
              FYTextButton(
                text: "Change Number",
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
