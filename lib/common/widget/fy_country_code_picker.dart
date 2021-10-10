import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';

class FYCountryCodePicker extends StatelessWidget {
  final Function(CountryCode countryCode)? onChanged;
  final CountryCode selectedCountryCode;

  FYCountryCodePicker({this.onChanged, required this.selectedCountryCode});

  @override
  Widget build(BuildContext context) {
    return CountryCodePicker(
      onChanged: onChanged,
      padding: EdgeInsets.zero,
      showFlag: false,
      showDropDownButton: true,
      initialSelection: selectedCountryCode.code,
      showOnlyCountryWhenClosed: false,
      favorite: [selectedCountryCode.dialCode!],
    );
  }
}
