import 'package:flutter/material.dart';
import 'package:food_yours_customer/common/widget/app_button.dart';
import 'package:food_yours_customer/common/widget/round_image.dart';
import 'package:food_yours_customer/home/controller/home_tab_controller.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/resources/icons.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:get/instance_manager.dart';

class ProfileAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Function sh = sHeight(context);
    Function sw = sWidth(context);

    return Container(
      color: FYColors.subtleBlack5,
      padding: EdgeInsets.symmetric(horizontal: sw(25)),
      child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        RoundImage(height: sh(40), width: sw(40)),
        SizedBox(width: sw(12)),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "John Doe",
              style: context.theme.textTheme.headline2!.copyWith(fontSize: sh(Dimens.k16)),
            ),
            Text("johndoe@google.com", style: context.theme.textTheme.caption!.copyWith(fontSize: sh(12))),
          ],
        ),
        Expanded(child: Container()),
        Text(
          "-logout",
          style: context.theme.textTheme.caption!.copyWith(fontSize: sh(12)),
        ),
      ]),
    );
  }
}
