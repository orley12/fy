import 'package:flutter/material.dart';
import 'package:food_yours_customer/cart/controller/cart_tab_controller.dart';
import 'package:food_yours_customer/common/widget/app_button.dart';
import 'package:food_yours_customer/resources/Images.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:get/instance_manager.dart';

class CartCard extends StatelessWidget {
  final CartTabController widgetCtrl = Get.find<CartTabController>();

  @override
  Widget build(BuildContext context) {
    final Function sh = sHeight(context);
    final Function sw = sWidth(context);

    return FYButton(
      onTap: widgetCtrl.gotoCartOrderSummaryScreen,
      child: Container(
        height: sh(98),
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(horizontal: sw(8)),
        decoration: BoxDecoration(
          color: context.theme.backgroundColor,
          borderRadius: BorderRadius.circular(4),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.01), blurRadius: 8, offset: Offset(0, 1))],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Center(
                    child: Container(
                      height: sh(82),
                      width: sh(86),
                      decoration: BoxDecoration(
                          image: DecorationImage(image: AssetImage(Images.female_chef), fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(4)),
                    ),
                  ),
                  SizedBox(height: sh(7)),
                  Container(
                    width: sw(212),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RichText(
                          textAlign: TextAlign.start,
                          text: TextSpan(children: <TextSpan>[
                            TextSpan(
                              style: context.theme.textTheme.caption!.copyWith(fontSize: sh(Dimens.k12)),
                              text: "Order Chef: ",
                            ),
                            TextSpan(
                              style: context.theme.textTheme.caption!
                                  .copyWith(fontSize: sh(Dimens.k12), fontWeight: FontWeight.w400, color: FYColors.darkerBlack2),
                              text: "Omowunmi O.",
                            ),
                          ]),
                        ),
                        SizedBox(height: sh(8)),
                        RichText(
                          textAlign: TextAlign.start,
                          text: TextSpan(children: <TextSpan>[
                            TextSpan(
                              style: context.theme.textTheme.caption!.copyWith(fontSize: sh(Dimens.k12)),
                              text: "Total Price: ",
                            ),
                            TextSpan(
                              style: context.theme.textTheme.headline3!.copyWith(fontSize: sh(Dimens.k12)),
                              text: "N 9,400",
                            ),
                          ]),
                        ),
                        SizedBox(height: sh(8)),
                        RichText(
                          textAlign: TextAlign.start,
                          text: TextSpan(children: <TextSpan>[
                            TextSpan(
                              style: context.theme.textTheme.caption!.copyWith(fontSize: sh(Dimens.k12)),
                              text: "Default Address: ",
                            ),
                            TextSpan(
                              style: context.theme.textTheme.caption!
                                  .copyWith(fontSize: sh(Dimens.k12), fontWeight: FontWeight.w400, color: FYColors.darkerBlack2),
                              text: "23 Barnawa, Kaduna Nigeria.",
                            ),
                          ]),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
