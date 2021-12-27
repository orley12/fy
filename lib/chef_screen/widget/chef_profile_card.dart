import 'package:flutter/material.dart';
import 'package:food_yours_customer/chef_screen/controller/chef_screen_controller.dart';
import 'package:food_yours_customer/chef_screen/widget/fy_sliding_segmented_control.dart';
import 'package:food_yours_customer/common/widget/local_theme.dart';
import 'package:food_yours_customer/common/widget/text_button.dart';
import 'package:food_yours_customer/home/widget/fy_chip.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:get/instance_manager.dart';

class ChefProfileCard extends StatelessWidget {
  final ChefScreenController widgetCtrl = Get.find<ChefScreenController>();

  @override
  Widget build(BuildContext context) {
    final Function sh = sHeight(context);
    final Function sw = sWidth(context);

    return Obx(
      () => Container(
        decoration: BoxDecoration(
            color: context.theme.backgroundColor,
            boxShadow: widgetCtrl.selectedSegment.value > 1
                ? null
                : [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 8,
                        offset: Offset(0, 1))
                  ]),
        child: Column(
          children: [
            Text(
              "${widgetCtrl.chef.value.chefName}",
              textAlign: TextAlign.center,
              style: context.theme.textTheme.headline5!.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: Dimens.k24,
              ),
            ),
            SizedBox(height: sh(Dimens.k10)),
            Wrap(
                children: List.generate(
              widgetCtrl.tags.value.length,
              (index) => Transform(
                transform: Matrix4.identity()..scale(0.8),
                child: FYChip(widgetCtrl.tags.value[index],
                    backgroundColor: FYColors.lighterBlack2,
                    textColor: context.theme.textTheme.button!.color),
              ),
            )),
            Text("Cheapest Dish(minimum):",
                style: context.theme.textTheme.headline4!
                    .copyWith(fontSize: sh(Dimens.k12))),
            SizedBox(height: sh(Dimens.k4)),
            Text("N 4,000",
                style: context.theme.textTheme.headline5!.copyWith(
                    fontWeight: FontWeight.w700, fontSize: Dimens.k24)),
            SizedBox(height: sh(Dimens.k8)),
            Text("Delivery Time:",
                style: context.theme.textTheme.headline5!.copyWith(
                    fontWeight: FontWeight.w400, fontSize: Dimens.k12)),
            Text("32hrs",
                style: context.theme.textTheme.headline5!.copyWith(
                    fontWeight: FontWeight.w700, fontSize: Dimens.k24)),
            SizedBox(height: sh(Dimens.k16)),
            Obx(
              () => LocalTheme(
                child: FYTextButton(
                  text: "Follow Chef",
                  onPressed: widgetCtrl.toggleFollowingStatus,
                ),
                // buttonStyle: subTextButtonStyle.copyWith(
                //   backgroundColor: MaterialStateProperty.all<Color>(
                //       widgetCtrl.isFollowed.value
                //           ? FYColors.subtleGreen1
                //           : FYColors.subtleBlue2),
                //   minimumSize: MaterialStateProperty.all<Size>(
                //     Size(sw(88), sh(37)),
                //   ),
                // ),
                buttonTextStyle: context.theme.textTheme.headline3!.copyWith(
                    fontSize: Dimens.k16,
                    color: widgetCtrl.isFollowed.value
                        ? FYColors.mainGreen
                        : FYColors.mainBlue,
                    fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(height: sh(Dimens.k8)),
            Text("*You get notified when chef add new menu items",
                style: context.theme.textTheme.headline4!
                    .copyWith(fontSize: sh(Dimens.k12))),
            SizedBox(height: sh(Dimens.k24)),
            Obx(
              () => Container(
                width: sw(326),
                child: FYSlidingSegmentedControl(
                    labels: {
                      1: Text("Menu",
                          style: widgetCtrl.selectedSegment.value == 1
                              ? context.theme.textTheme.headline5!.copyWith(
                                  fontWeight: FontWeight.w700,
                                  fontSize: Dimens.k12)
                              : context.theme.textTheme.headline4!
                                  .copyWith(fontSize: sh(Dimens.k12))),
                      2: Text("Reviews",
                          style: widgetCtrl.selectedSegment.value == 2
                              ? context.theme.textTheme.headline5!.copyWith(
                                  fontWeight: FontWeight.w700,
                                  fontSize: Dimens.k12)
                              : context.theme.textTheme.headline4!
                                  .copyWith(fontSize: sh(Dimens.k12))),
                      3: Text("Chef info",
                          style: widgetCtrl.selectedSegment.value == 3
                              ? context.theme.textTheme.headline5!.copyWith(
                                  fontWeight: FontWeight.w700,
                                  fontSize: Dimens.k12)
                              : context.theme.textTheme.headline4!
                                  .copyWith(fontSize: sh(Dimens.k12))),
                    },
                    onChanged: widgetCtrl.onSegmentSelected,
                    selectedSegment: widgetCtrl.selectedSegment.value),
              ),
            ),
            SizedBox(height: sh(Dimens.k17)),
          ],
        ),
      ),
    );
  }
}
