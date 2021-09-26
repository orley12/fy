import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';

class FYCountryCodePicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CountryCodePicker(
      onChanged: print,
      padding: EdgeInsets.zero,
      showFlag: false,
      showDropDownButton: true,
      initialSelection: 'NG',
      showOnlyCountryWhenClosed: false,
      favorite: ['+234'],
    );
  }
}
