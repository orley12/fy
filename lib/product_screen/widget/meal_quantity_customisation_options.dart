// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter/material.dart';
import 'package:food_yours_customer/common/view_model/selectable.dart';
import 'package:food_yours_customer/common/widget/option_item.dart';
import 'package:food_yours_customer/common/widget/text/mulish_600_text.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';

class MealCustomizationQuantityOptions extends StatelessWidget {
  final List<Selectable> listItems;
  final Function(FYOptionItem? index) onSelected;
  final FYOptionItem selectedItem;

  MealCustomizationQuantityOptions({
    this.listItems = const [],
    required this.onSelected,
    required this.selectedItem,
  });

  @override
  Widget build(BuildContext context) {
    Function sh = sHeight(context);
    Function sw = sWidth(context);

    return ListView.separated(
      padding: EdgeInsets.zero,
      itemCount: listItems.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) => ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 0.0),
        leading: SizedBox(
          width: sw(Dimens.k300),
          child: Mulish600Text(
            text: "${listItems[index].name}",
            color: FYColors.darkerBlack7,
            fontSize: sh(Dimens.k16),
          ),
        ),
        trailing: Radio<FYOptionItem>(
          groupValue: selectedItem,
          onChanged: onSelected,
          value: listItems[index] as FYOptionItem,
        ),
        onTap: () => onSelected(listItems[index] as FYOptionItem),
      ),
      separatorBuilder: (BuildContext context, int index) =>
          Divider(thickness: 0.4, height: 0),
    );
  }
}
