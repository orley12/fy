import 'package:flutter/material.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class FilterCategoryOptions extends StatelessWidget {
  final List listItems;
  final Function(int index) onSelected;
  final int selectedIndex;

  FilterCategoryOptions(
      {this.listItems = const [],
      required this.onSelected,
      this.selectedIndex = 0});

  @override
  Widget build(BuildContext context) {
    Function sh = sHeight(context);

    return Column(
      // shrinkWrap: true,
      // physics: NeverScrollableScrollPhysics(),
      // itemCount: listItems.length,
      // itemBuilder: (BuildContext buildContext, int index) =>
      children: List.generate(
        listItems.length,
        (index) => ListTile(
          minVerticalPadding: 0,
          contentPadding: EdgeInsets.zero,
          dense: true,
          leading: Checkbox(
              value: index == selectedIndex,
              onChanged: (_) => onSelected(index),
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap),
          title: Text(
            listItems[index].name,
            style: context.theme.textTheme.caption!.copyWith(
                fontSize: sh(Dimens.k16),
                fontWeight: FontWeight.w400,
                color: FYColors.darkerBlack2),
          ),
          onTap: () => onSelected(index),
        ),
      ),
    );
  }
}
