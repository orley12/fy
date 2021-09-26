import 'package:flutter/material.dart';
import 'package:food_yours_customer/common/widget/app_button.dart';
import 'package:food_yours_customer/resources/Images.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/resources/icons.dart';
import 'package:food_yours_customer/search_screen/controller/search_screen_controller.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class SearchResultCard extends StatelessWidget {
  final SearchScreenController widgetCtrl;
  final int index;

  SearchResultCard({required this.widgetCtrl, required this.index});

  @override
  Widget build(BuildContext context) {
    Function sh = sHeight(context);
    Function sw = sWidth(context);

    return ClipRRect(
      borderRadius: BorderRadius.circular(Dimens.k12),
      child: Card(
        elevation: 0,
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: FYColors.subtleBlack6, width: 0.4), borderRadius: BorderRadius.circular(Dimens.k12)),
          padding: EdgeInsets.only(left: sw(12), right: sw(12), top: sw(12)),
          child: Column(
            children: [
              Stack(
                overflow: Overflow.visible,
                children: [
                  FYButton(
                    onTap: widgetCtrl.gotoFoodScreen,
                    child: Container(
                        height: sh(124),
                        width: sw(303),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(Dimens.k8),
                            image: DecorationImage(image: AssetImage(Images.search_result), fit: BoxFit.cover))),
                  ),
                  Positioned(
                    bottom: -25,
                    right: 7,
                    child: buildChefImage(sh, sw, context),
                  ),
                ],
              ),
              SizedBox(height: sh(Dimens.k12)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  buildProductNameAndPriceColumn(context, sh),
                  buildChefNameAndRatingColumn(context, sh),
                ],
              ),
              SizedBox(height: sh(Dimens.k8)),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildChefImage(Function sh, Function sw, BuildContext context) {
    return FYButton(
        child: Center(
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Container(
                  height: sh(45),
                  width: sw(45),
                  decoration: BoxDecoration(color: context.theme.textTheme.button!.color, shape: BoxShape.circle)),
              Container(
                  height: sh(40),
                  width: sw(40),
                  decoration: BoxDecoration(
                      color: context.theme.textTheme.button!.color,
                      shape: BoxShape.circle,
                      image: DecorationImage(image: AssetImage(Images.chef), fit: BoxFit.cover)))
            ],
          ),
        ),
        onTap: widgetCtrl.goToChefProfile);
  }

  Column buildProductNameAndPriceColumn(BuildContext context, Function sh) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        "Jollof Rice",
        style: context.theme.textTheme.headline2!.copyWith(fontSize: sh(Dimens.k16)),
      ),
      SizedBox(height: sh(Dimens.k12)),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        RichText(
          textAlign: TextAlign.start,
          text: TextSpan(children: <TextSpan>[
            TextSpan(
              style: context.theme.textTheme.caption!.copyWith(fontSize: Dimens.k12, fontWeight: FontWeight.w600),
              text: "From ",
            ),
            TextSpan(
              style: context.theme.textTheme.headline3!.copyWith(fontSize: Dimens.k12),
              text: "N3,500",
            ),
          ]),
        ),
      ]),
    ]);
  }

  Widget buildChefNameAndRatingColumn(BuildContext context, Function sh) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          "Omowunmi O.",
          style: context.theme.textTheme.caption!.copyWith(fontSize: sh(Dimens.k16)),
        ),
        Row(
          children: [
            Icon(
              FYIcons.star,
              color: context.theme.textTheme.headline3!.color,
              size: sh(Dimens.k16),
            ),
            SizedBox(height: sh(5.33)),
            Text(
              "5.0(22)",
              textAlign: TextAlign.end,
              style: context.theme.textTheme.headline3!.copyWith(fontSize: Dimens.k12),
            )
          ],
        ),
      ],
    );
  }
}
