import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_yours_customer/chef_screen/widget/food_detail_quantity_control.dart';
import 'package:food_yours_customer/common/widget/app_button.dart';
import 'package:food_yours_customer/common/widget/local_theme.dart';
import 'package:food_yours_customer/common/widget/text_button.dart';
import 'package:food_yours_customer/product_screen/widget/article.dart';
import 'package:food_yours_customer/resources/Images.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/resources/icons.dart';
import 'package:food_yours_customer/resources/style.dart';
import 'package:food_yours_customer/util/navigation_util.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class FoodDetailsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Function sh = sHeight(context);
    Function sw = sWidth(context);

    return ClipRRect(
      borderRadius: BorderRadius.circular(Dimens.k12),
      child: Card(
        elevation: 2,
        child: Container(
          padding: EdgeInsets.only(left: sw(12), right: sw(12), top: sw(12)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                overflow: Overflow.visible,
                children: [
                  Container(
                      height: sh(124),
                      width: sw(303),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Dimens.k8),
                          image: DecorationImage(image: AssetImage(Images.popular_chef), fit: BoxFit.cover))),
                ],
              ),
              SizedBox(height: sh(Dimens.k12)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Article(
                      descriptionFontSize: Dimens.k12,
                      title: "Iyan and Egusi",
                      description:
                          "A meal of pounded yam and melon soup, a traditional meal for the yorubas in the western part of Nigeria.."),
                  // buildProductNameAndPriceColumnn(context, sh),
                  // buildChefNameAndRatingColumn(context, sh),
                ],
              ),
              SizedBox(height: sh(Dimens.k17)),
              RichText(
                textAlign: TextAlign.start,
                text: TextSpan(children: <TextSpan>[
                  TextSpan(
                    style: context.theme.textTheme.caption!.copyWith(fontSize: Dimens.k12, fontWeight: FontWeight.w600),
                    text: "From  ",
                  ),
                  TextSpan(
                    style: context.theme.textTheme.headline3!.copyWith(fontSize: Dimens.k16),
                    text: "N3,500",
                  ),
                ]),
              ),
              SizedBox(height: sh(4.47)),
              Divider(thickness: 0.19, height: 0),
              SizedBox(height: sh(5.67)),
              Container(
                height: sh(34.74),
                child: FoodDetailQuantityControl(),
              ),
              SizedBox(height: sh(16.21)),
            ],
          ),
        ),
      ),
    );
  }

  Column buildProductNameAndPriceColumnn(BuildContext context, Function sh) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        "Iyan and Egusi",
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

  Column buildChefNameAndRatingColumn(BuildContext context, Function sh) {
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
