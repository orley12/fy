import 'package:flutter/material.dart';
import 'package:food_yours_customer/common/widget/app_button.dart';
import 'package:food_yours_customer/home/controller/home_tab_controller.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/resources/icons.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:get/instance_manager.dart';

class HomeAppBar extends StatelessWidget {
  final HomeTabController widgetController = Get.put(HomeTabController());

  @override
  Widget build(BuildContext context) {
    Function sh = sHeight(context);
    Function sw = sWidth(context);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: sw(25)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          Text(
            "Hello, Mike",
            style: context.theme.textTheme.headline2!.copyWith(fontSize: sh(Dimens.k16)),
          ),
          Expanded(child: Container()),
          FYButton(child: Icon(FYIcons.search), onTap: widgetController.openSearchBackDrop),
          SizedBox(width: sw(Dimens.k48)),
          Icon(FYIcons.bell),
        ]),
        SizedBox(height: sh(Dimens.k4)),
        Text(
          "What would you like to order?",
          style: context.theme.textTheme.caption!.copyWith(fontSize: sh(13)),
        ),
      ]),
    );
  }
}
