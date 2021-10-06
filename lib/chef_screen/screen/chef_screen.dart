import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_yours_customer/chef_screen/controller/chef_screen_controller.dart';
import 'package:food_yours_customer/chef_screen/tabs/chef_info_tab.dart';
import 'package:food_yours_customer/chef_screen/tabs/chef_menu_tab.dart';
import 'package:food_yours_customer/chef_screen/tabs/chef_review_tab.dart';
import 'package:food_yours_customer/chef_screen/widget/chef_cover_photo.dart';
import 'package:food_yours_customer/chef_screen/widget/chef_profile_card.dart';
import 'package:food_yours_customer/common/widget/app_button.dart';
import 'package:food_yours_customer/resources/Images.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/util/navigation_util.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:get/instance_manager.dart';

class ChefScreen extends StatelessWidget {
  final ChefScreenController widgetCtrl = Get.put(ChefScreenController());

  @override
  Widget build(BuildContext context) {
    final Function sh = sHeight(context);
    final Function sw = sWidth(context);

    return Obx(
      () => Scaffold(
        backgroundColor: widgetCtrl.selectedSegment.value > 1 ? FYColors.subtleBlack5 : context.theme.backgroundColor,
        body: CustomScrollView(
          controller: widgetCtrl.scrollController,
          slivers: <Widget>[
            SliverAppBar(
                automaticallyImplyLeading: false,
                leadingWidth: sw(80),
                leading: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(width: sw(24)),
                    FYButton(
                      child: SvgPicture.asset(Images.back, height: sh(40), width: sw(40)),
                      onTap: pop,
                    )
                  ],
                ),
                actions: [SvgPicture.asset(Images.cart, height: sh(40), width: sw(40)), SizedBox(width: sw(24))],
                expandedHeight: sh(245),
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(background: ChefCoverPhoto())),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  ChefProfileCard(),
                  SizedBox(height: Dimens.k32),
                  Obx(
                    () => Container(
                      padding: EdgeInsets.symmetric(horizontal: sw(22)),
                      child: buildChefTab(),
                    ),
                  ),
                  // ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildChefTab() {
    if (widgetCtrl.selectedSegment.value == 1) {
      return ChefMenuTab(widgetCtrl: widgetCtrl);
    } else if (widgetCtrl.selectedSegment.value == 2) {
      return ChefReviewTab();
    } else {
      return ChefInfoTab();
    }
  }
}
