import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_yours_customer/home/view_model/chef_review_view_modal.dart';
import 'package:food_yours_customer/resources/Images.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/resources/icons.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class ChefReviewCard extends StatelessWidget {
  final ChefReviewViewModel chefReviewViewModel;
  ChefReviewCard(this.chefReviewViewModel);

  @override
  Widget build(BuildContext context) {
    Function sh = sHeight(context);
    Function sw = sWidth(context);

    return ClipRRect(
      borderRadius: BorderRadius.circular(Dimens.k12),
      child: Card(
        elevation: 0,
        child: Container(
          padding: EdgeInsets.only(
              left: sw(16), right: sw(13), top: sh(16), bottom: sh(12)),
          child: Column(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Container(
                        height: sh(40),
                        width: sw(40),
                        child: FadeInImage.assetNetwork(
                          placeholder: Images.anonymous_chef_reviewer,
                          image: chefReviewViewModel.userImage,
                        ),
                      ),
                    ),
                    SizedBox(width: sw(12)),
                    Expanded(
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("${chefReviewViewModel.userRemark}",
                                    style: context.theme.textTheme.headline2!
                                        .copyWith(fontSize: sh(Dimens.k16))),
                                Row(
                                    children: List.generate(
                                  5,
                                  (int index) => Icon(FYIcons.star,
                                      size: Dimens.k16,
                                      color: index <=
                                              int.parse(chefReviewViewModel
                                                  .userRating)
                                          ? FYColors.mainOrange
                                          : FYColors.subtleBlack2),
                                ))
                              ]),
                          Text(
                              "${"" /* DateTimeUtil.stringTodateTime(chefReviewViewModel.userDate) */}",
                              style: context.theme.textTheme.headline4!
                                  .copyWith(fontSize: sh(Dimens.k12))),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 240,
                  child: Text("${chefReviewViewModel.userRemark}",
                      maxLines: 3,
                      style: context.theme.textTheme.headline4!
                          .copyWith(fontSize: sh(Dimens.k12))),
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
