import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class FYCountryCodePicker extends StatelessWidget {
  final Function(CountryCode countryCode)? onChanged;
  final CountryCode selectedCountryCode;

  FYCountryCodePicker({this.onChanged, required this.selectedCountryCode});

  @override
  Widget build(BuildContext context) {
    Function sh = sHeight(context);

    return Theme(
      data: ThemeData(
        textButtonTheme: TextButtonThemeData(),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: FYColors.mainRed,
        ),
      ),
      child: CountryCodePicker(
        onChanged: onChanged,
        padding: EdgeInsets.zero,
        showFlag: false,
        showDropDownButton: true,
        initialSelection: selectedCountryCode.code,
        showOnlyCountryWhenClosed: false,
        textStyle: context.theme.textTheme.headline2!.copyWith(
          fontSize: sh(Dimens.k12),
          color: FYColors.darkerBlack2,
        ),
        favorite: [selectedCountryCode.dialCode!],
      ),
    );
  }
}
