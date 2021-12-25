import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:food_yours_customer/home/view_model/popular_chef_view_model.dart';
import 'package:food_yours_customer/home/widget/food_category_label.dart';
import 'package:food_yours_customer/home/widget/rating.dart';
import 'package:food_yours_customer/resources/Images.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:shimmer/shimmer.dart';

class PopularChefItem extends StatelessWidget {
  final PopularChefViewModel popularChef;

  PopularChefItem(this.popularChef);

  @override
  Widget build(BuildContext context) {
    Function sh = sHeight(context);
    Function sw = sWidth(context);

    return Stack(
      children: [
        Container(
          height: sh(141.18),
          width: sh(142),
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(popularChef.popularChefImagePath),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.63), BlendMode.darken),
              ),
              borderRadius: BorderRadius.circular(9.85)),
        ),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(height: sh(11.08)),
          Container(
              child: buildFoodCategoryAndStartPriceWidget(context, sh, sw),
              width: sh(132.82)),
          SizedBox(height: sh(58.5)),
          Container(
            padding: EdgeInsets.symmetric(horizontal: sw(7.82)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildNameAddressWidget(context, sh, sw),
                Container(
                  child: buildAvailableDaysAndRatingWidget(context, sh, sw),
                ),
              ],
            ),
          ),
          SizedBox(width: sw(Dimens.k7)),
        ]),
      ],
    );
  }

  Column buildNameAddressWidget(
      BuildContext context, Function sh, Function sw) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(popularChef.chefName,
            style: context.theme.textTheme.button!.copyWith(
                fontSize: sh(Dimens.k12), fontWeight: FontWeight.w700)),
        SizedBox(width: sw(Dimens.k7)),
        Text(popularChef.kitchenAddress,
            style: context.theme.textTheme.caption!.copyWith(
                color: FYColors.subtleBlack3,
                fontSize: sh(Dimens.k10),
                fontWeight: FontWeight.w600)),
        SizedBox(width: sw(Dimens.k7)),
      ],
    );
  }

  Widget buildAvailableDaysAndRatingWidget(
      BuildContext context, Function sh, Function sw) {
    return Container(
      width: sh(125),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text("DD: ",
                  maxLines: 1,
                  style: context.theme.textTheme.caption!.copyWith(
                      color: FYColors.subtleBlack3,
                      fontSize: sh(Dimens.k10),
                      fontWeight: FontWeight.w600)),
              Text("",
                  maxLines: 1,
                  style: context.theme.textTheme.button!.copyWith(
                      fontSize: sh(Dimens.k10), fontWeight: FontWeight.w600)),
            ],
          ),
          Rating(popularChef.ratings)
        ],
      ),
    );
  }

  Row buildFoodCategoryAndStartPriceWidget(
      BuildContext context, Function sh, Function sw) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: CardStrip(AutoSizeText(
              popularChef.foodCategory,
              minFontSize: 8,
              style: context.theme.textTheme.headline3!
                  .copyWith(fontSize: sh(9.85)),
            )),
            height: sh(16.42),
            width: sw(46.79),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text("Starting at:",
                  style: context.theme.textTheme.caption!.copyWith(
                      color: FYColors.subtleBlack3, fontSize: sh(Dimens.k10))),
              Text("N 4,000",
                  style: context.theme.textTheme.button!.copyWith(
                      fontSize: sh(Dimens.k10), fontWeight: FontWeight.w700))
            ],
          ),
        ]);
  }
}

class PopularChefLoadingItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Function sh = sHeight(context);
    final Function sw = sWidth(context);

    return Shimmer.fromColors(
      child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Container(
              height: sh(141.18),
              width: sh(142),
              decoration: BoxDecoration(
                color: Color(0xffeaf0f0),
                borderRadius: BorderRadius.circular(Dimens.k4),
                image: DecorationImage(
                    image: AssetImage(Images.food_category), fit: BoxFit.fill),
              ))),
      baseColor: Color(0xffeaf0f0),
      highlightColor: Colors.white,
    );
  }
}
