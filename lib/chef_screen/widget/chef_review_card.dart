import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_yours_customer/common/widget/app_button.dart';
import 'package:food_yours_customer/common/widget/local_theme.dart';
import 'package:food_yours_customer/common/widget/text_button.dart';
import 'package:food_yours_customer/product_screen/widget/article.dart';
import 'package:food_yours_customer/resources/Images.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/resources/icons.dart';
import 'package:food_yours_customer/resources/style.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class ChefReviewCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Function sh = sHeight(context);
    Function sw = sWidth(context);

    return ClipRRect(
      borderRadius: BorderRadius.circular(Dimens.k12),
      child: Card(
        elevation: 0,
        child: Container(
          padding: EdgeInsets.only(left: sw(16), right: sw(13), top: sh(16), bottom: sh(12)),
          child: Column(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(Images.anonymous_chef_reviewer),
                    SizedBox(width: sw(12)),
                    Expanded(
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                            Text("Undisclosed", style: context.theme.textTheme.headline2!.copyWith(fontSize: sh(Dimens.k16))),
                            Row(
                                children: List.generate(
                              5,
                              (int index) => Icon(FYIcons.star, size: Dimens.k16, color: FYColors.mainOrange),
                            ))
                          ]),
                          Text("26/07/2021", style: context.theme.textTheme.headline4!.copyWith(fontSize: sh(Dimens.k12))),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 240,
                  child: Text(
                      "Highly recommended, the jollof rice taste exceptionally well, she is making my stay in the country worthwhile.",
                      maxLines: 3,
                      style: context.theme.textTheme.headline4!.copyWith(fontSize: sh(Dimens.k12))),
                ),
              ],
            ),
            SizedBox(height: sh(10.99)),
          ]),
        ),
      ),
    );
  }
}
