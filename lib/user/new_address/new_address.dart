import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:food_yours_customer/common/widget/fy_country_code_picker.dart';
import 'package:food_yours_customer/common/widget/input_field_wrapper.dart';
import 'package:food_yours_customer/common/widget/local_theme.dart';
import 'package:food_yours_customer/common/widget/secondary_app_bar.dart';
import 'package:food_yours_customer/common/widget/secondary_text_input_field.dart';
import 'package:food_yours_customer/common/widget/text_button.dart';
import 'package:food_yours_customer/resources/Images.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class NewAddressScreen extends StatelessWidget {
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
            child: SecondaryAppBar(title: "New Address")),
        body: ListView(
            padding: EdgeInsets.symmetric(horizontal: sw(24), vertical: sh(24)),
            children: [
              InputFieldWrapper(
                labelText: "Address Line 1",
                child: SecondaryTextField(
                  hintText: "Plot 5 Ibeju-Lekki",
                  hintTextColor: FYColors.subtleBlack,
                ),
              ),
              SizedBox(height: sh(16)),
              InputFieldWrapper(
                labelText: "Address Line 2",
                child: SecondaryTextField(
                  hintText: "Lagos Nigeria",
                  hintTextColor: FYColors.subtleBlack,
                ),
              ),
              SizedBox(height: sh(16)),
              InputFieldWrapper(
                labelText: "Contact Number",
                child: SecondaryTextField(
                  hintText: "0701 234 5678",
                  hintTextColor: FYColors.subtleBlack,
                  prefixIcon: SizedBox(
                    width: 85,
                    child: LocalTheme(
                      buttonTextStyle: context.theme.textTheme.bodyText1,
                      bodyStyle2: context.theme.textTheme.bodyText2,
                      child: FYCountryCodePicker(
                          selectedCountryCode: CountryCode(
                        flagUri: Images.chef_place_holder,
                        name: "Nigeria",
                        code: "NG",
                        dialCode: "+234",
                      )),
                      //     SizedBox(
                    ),
                  ),
                ),
              ),
              SizedBox(height: sh(16)),
              InputFieldWrapper(
                labelText: "Name this Address(e.g home, work, gym etc.)",
                child: SecondaryTextField(
                  hintText: "Home",
                  hintTextColor: FYColors.subtleBlack,
                ),
              ),
              SizedBox(height: sh(24)),
              FYTextButton(
                text: "Add Address",
                onPressed: () {},
              ),
            ]),
      ),
    );
  }
}
