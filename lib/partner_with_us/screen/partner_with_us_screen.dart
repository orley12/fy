import 'package:flutter/material.dart';
import 'package:food_yours_customer/common/widget/secondary_app_bar.dart';
import 'package:food_yours_customer/legal/controller/legal_screen_controller.dart';
import 'package:food_yours_customer/partner_with_us/widget/partner_with_us_card.dart';
import 'package:food_yours_customer/resources/Images.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:get/instance_manager.dart';

class PartnerWithUsScreen extends StatelessWidget {
  final PartnerWithUsScreenController widgetCtrl = Get.put(PartnerWithUsScreenController());

  @override
  Widget build(BuildContext context) {
    final Function sh = sHeight(context);
    final Function sw = sWidth(context);

    return Container(
      color: context.theme.backgroundColor,
      child: Scaffold(
        backgroundColor: FYColors.subtleBlack5,
        appBar: PreferredSize(preferredSize: Size(sw(20), sh(46.41)), child: SecondaryAppBar(title: "Partner with Us")),
        body: ListView(padding: EdgeInsets.symmetric(horizontal: sw(24), vertical: sh(24)), children: [
          PartnerWithUsCard(
            image: Images.male_chef,
            title: "Become A chef",
            subTitle: "Make money doing what you love, cook and sell from home.",
          ),
          SizedBox(height: sh(24)),
          PartnerWithUsCard(
            image: Images.courier,
            title: "Become A Courier",
            subTitle: "Earn with your vehicle when you deliver food for foodyours.",
          ),
        ]),
      ),
    );
  }
}

class PartnerWithUsScreenController extends GetxController {
  downloadChefApp() => print("downloading chef app...");
  downloadCourierApp() => print("downloading chef app...");
}
