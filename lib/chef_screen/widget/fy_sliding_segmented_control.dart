import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class FYSlidingSegmentedControl extends StatelessWidget {
  final int selectedSegment;
  final Function(dynamic) onChanged;
  final Map<dynamic, Widget> labels;

  FYSlidingSegmentedControl({this.selectedSegment = 0, required this.onChanged, required this.labels});
  @override
  Widget build(BuildContext context) {
    return CupertinoSlidingSegmentedControl(
      groupValue: selectedSegment,
      children: labels,
      onValueChanged: onChanged,
      backgroundColor: FYColors.subtleBlack5,
    );
  }
}
