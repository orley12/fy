import 'package:flutter/material.dart';
import 'package:food_yours_customer/common/widget/input_field_wrapper.dart';
import 'package:food_yours_customer/common/widget/app_bar/primary_app_bar.dart';
import 'package:food_yours_customer/common/widget/text_field/secondary_text_field.dart';
import 'package:food_yours_customer/common/widget/text_button.dart';
import 'package:food_yours_customer/controller/dashbard/dashboard_screen_controller.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';

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
          appBar: PreferredSize(
              preferredSize: Size(20, sh(46.41)),
              child: PrimaryAppBar(
                title: "Change Number",
                elevation: 2.0,
              )),
          body: ListView(
            padding: EdgeInsets.symmetric(horizontal: sw(24)),
            children: [
              SizedBox(height: sh(16)),
              InputFieldWrapper(
                labelText: "Enter New Phone Number",
                child: SecondaryTextField(
                    hintText: "07123456789",
                    hintTextColor: FYColors.subtleBlack),
              ),
              SizedBox(height: sh(16)),
              InputFieldWrapper(
                labelText: "Enter Password",
                child: SecondaryTextField(
                    hintText: "*************",
                    hintTextColor: FYColors.subtleBlack),
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
