import 'package:flutter/material.dart';
import 'package:food_yours_customer/chef_screen/controller/chef_screen_controller.dart';
import 'package:food_yours_customer/resources/Images.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:get/instance_manager.dart';

class ChefCoverPhoto extends StatelessWidget {
  final ChefScreenController widgetCtrl = Get.find<ChefScreenController>();

  @override
  Widget build(BuildContext context) {
    final Function sh = sHeight(context);
    final Function sw = sWidth(context);

    return Container(
      height: sh(245),
      color: context.theme.backgroundColor,
      child: Stack(
        children: [
          Container(
              color: context.theme.backgroundColor,
              child: ClipRRect(
                child: Container(
                  height: sh(Dimens.k222),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(Images.chef_bg_image),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.73), BlendMode.darken),
                      ),
                      borderRadius: BorderRadius.circular(9.85)),
                ),
              )),
          Align(alignment: Alignment.bottomCenter, child: buildChefImage(sh, sw, context))
        ],
      ),
    );
  }

  Widget buildChefImage(Function sh, Function sw, BuildContext context) {
    return /* Obx(
      () =>  Hero(
          tag: widgetCtrl.chefImageHero.value,
          child:  */
        Container(
            height: 139,
            width: 139,
            decoration: BoxDecoration(
                color: context.theme.textTheme.button!.color,
                border: Border.all(color: context.theme.textTheme.button!.color!, width: 4.0),
                shape: BoxShape.circle,
                image: DecorationImage(image: AssetImage(Images.chef), fit: BoxFit.cover))
            // ),
            // )
            );
  }
}
