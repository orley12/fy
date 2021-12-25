import 'package:flutter/material.dart';
import 'package:food_yours_customer/common/widget/app_button.dart';
import 'package:food_yours_customer/common/widget/option_item.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/resources/icons.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class SuggestionItem extends StatelessWidget {
  final FYOptionItem option;
  final Function? onSelected;

  SuggestionItem({required this.option, this.onSelected});

  @override
  Widget build(BuildContext context) {
    Function sh = sHeight(context);
    Function sw = sWidth(context);
    print("namenamenamenamenamenamenamename ${option.name}");
    return FYButton(
      onTap: onSelected == null ? null : () => onSelected!(option),
      child: Row(
        children: [
          Icon(FYIcons.search, size: 24, color: FYColors.lighterBlack3),
          SizedBox(width: sw(12)),
          Text(
            option.name,
            style: context.theme.textTheme.caption!
                .copyWith(fontSize: sh(Dimens.k16)),
          )
        ],
      ),
    );
  }
}
