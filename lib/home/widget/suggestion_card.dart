import 'package:flutter/material.dart';
import 'package:food_yours_customer/home/controller/home_tab_back_panel_controller.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/resources/icons.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class SuggestionCard extends StatelessWidget {
  dynamic widgetCtrl;

  SuggestionCard(this.widgetCtrl);

  @override
  Widget build(BuildContext context) {
    Function sh = sHeight(context);
    Function sw = sWidth(context);

    return ClipRRect(
      borderRadius: BorderRadius.circular(Dimens.k12),
      child: Card(
        elevation: 8,
        shadowColor: Color.fromRGBO(0, 99, 247, 0.2),
        child: Container(
          height: sh(209),
          width: sw(329),
          padding: EdgeInsets.symmetric(horizontal: sw(15), vertical: sh(12)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Suggestions",
                  style: context.theme.textTheme.caption!.copyWith(fontSize: sh(Dimens.k12), fontWeight: FontWeight.w600)),
              SizedBox(height: sh(20)),
              Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) => Row(
                    children: [
                      Icon(FYIcons.search, size: 24, color: FYColors.lighterBlack3),
                      SizedBox(width: sw(12)),
                      Text(
                        widgetCtrl.suggestions.value[index],
                        style: context.theme.textTheme.caption!.copyWith(fontSize: sh(Dimens.k16)),
                      )
                    ],
                  ),
                  separatorBuilder: (context, index) => SizedBox(height: sh(20)),
                  itemCount: widgetCtrl.suggestions.value.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
