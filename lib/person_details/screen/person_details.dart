import 'package:flutter/material.dart';
import 'package:food_yours_customer/common/widget/fy_country_code_picker.dart';
import 'package:food_yours_customer/common/widget/input_field_wrapper.dart';
import 'package:food_yours_customer/common/widget/local_theme.dart';
import 'package:food_yours_customer/common/widget/secondary_app_bar.dart';
import 'package:food_yours_customer/common/widget/secondary_text_input_field.dart';
import 'package:food_yours_customer/common/widget/square_image.dart';
import 'package:food_yours_customer/common/widget/text_button.dart';
import 'package:food_yours_customer/person_details/widget/image_editing_button.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class PersonalDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Function sh = sHeight(context);
    final Function sw = sWidth(context);

    return Container(
      color: context.theme.backgroundColor,
      child: Scaffold(
        backgroundColor: FYColors.subtleBlack5,
        appBar: PreferredSize(preferredSize: Size(sw(20), sh(46.41)), child: SecondaryAppBar(title: "Personal Details")),
        body: ListView(padding: EdgeInsets.symmetric(horizontal: sw(24), vertical: sh(24)), children: [
          SizedBox(height: sh(24)),
          Center(
            child: Stack(
              children: [
                SquareImage(height: sh(80), width: sw(80)),
                Positioned(right: 0, bottom: 0, child: ImageEditButton()),
              ],
            ),
          ),
          SizedBox(height: sh(24)),
          InputFieldWrapper(
            labelText: "First Name",
            child: SecondaryTextField(hintText: "John", hintTextColor: FYColors.subtleBlack),
          ),
          SizedBox(height: sh(16)),
          InputFieldWrapper(
            labelText: "Last Name",
            child: SecondaryTextField(hintText: "Doe", hintTextColor: FYColors.subtleBlack),
          ),
          SizedBox(height: sh(16)),
          InputFieldWrapper(
            labelText: "Email",
            child: SecondaryTextField(hintText: "johndoe@google.com", hintTextColor: FYColors.subtleBlack),
          ),
          SizedBox(height: sh(16)),
          InputFieldWrapper(
            labelText: "Phone Number",
            child: SecondaryTextField(
              hintText: "0701 234 5678",
              hintTextColor: FYColors.subtleBlack,
              prefixIcon: SizedBox(
                width: 85,
                child: LocalTheme(
                  buttonTextStyle: context.theme.textTheme.bodyText1,
                  bodyStyle2: context.theme.textTheme.bodyText2,
                  child: FYCountryCodePicker(),
                  //     SizedBox(
                ),
              ),
            ),
          ),
          SizedBox(height: sh(16)),
          InputFieldWrapper(
            labelText: "Date of Birth(optional)",
            child: SecondaryTextField(hintText: "day / month", hintTextColor: FYColors.subtleBlack),
          ),
          SizedBox(height: sh(16)),
          InputFieldWrapper(
            labelText: "Gender",
            child: SecondaryTextField(hintText: "Male", hintTextColor: FYColors.subtleBlack),
          ),
          SizedBox(height: sh(16)),
          InputFieldWrapper(
            labelText: "Password",
            child: SecondaryTextField(hintText: "Enter Password", hintTextColor: FYColors.subtleBlack),
          ),
          SizedBox(height: sh(24)),
          FYTextButton(
            text: "Save and Close",
            onPressed: () {},
          ),
        ]),
      ),
    );
  }
}
