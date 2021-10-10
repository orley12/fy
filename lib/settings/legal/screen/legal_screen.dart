import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_yours_customer/common/widget/app_button.dart';
import 'package:food_yours_customer/common/widget/secondary_app_bar.dart';
import 'package:food_yours_customer/resources/Images.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/settings/legal/controller/legal_screen_controller.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:get/instance_manager.dart';

class LegalScreen extends StatelessWidget {
  final LegalScreenController widgetCtrl = Get.put(LegalScreenController());

  @override
  Widget build(BuildContext context) {
    final Function sh = sHeight(context);
    final Function sw = sWidth(context);

    return Container(
      color: context.theme.backgroundColor,
      child: Scaffold(
        backgroundColor: FYColors.subtleBlack5,
        appBar: PreferredSize(preferredSize: Size(sw(20), sh(46.41)), child: SecondaryAppBar(title: "Legal")),
        body: ListView(padding: EdgeInsets.symmetric(horizontal: sw(24), vertical: sh(24)), children: [
          FYButton(
            child: ListTile(
                leading: Container(child: SvgPicture.asset(Images.clarity_list, height: sh(24), width: sw(24))),
                title: Text(
                  "Privacy Policy",
                  style: context.theme.textTheme.caption!
                      .copyWith(fontSize: sh(Dimens.k16), fontWeight: FontWeight.w400, color: FYColors.darkerBlack2),
                ),
                minLeadingWidth: 0),
            onTap: widgetCtrl.gotoPrivacyScreen,
          ),
          Divider(thickness: 0.5),
          FYButton(
            onTap: widgetCtrl.gotoTermsOfUseScreen,
            child: ListTile(
                leading: Container(child: SvgPicture.asset(Images.document_2, height: sh(24), width: sw(24))),
                title: Text(
                  "Terms of Use",
                  style: context.theme.textTheme.caption!
                      .copyWith(fontSize: sh(Dimens.k16), fontWeight: FontWeight.w400, color: FYColors.darkerBlack2),
                ),
                minLeadingWidth: 0),
          ),
          Divider(thickness: 0.5),
        ]),
      ),
    );
  }
}
