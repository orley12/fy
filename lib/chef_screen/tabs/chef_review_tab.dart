import 'package:flutter/material.dart';
import 'package:food_yours_customer/chef_screen/widget/chef_review_card.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';

class ChefReviewTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Function sh = sHeight(context);
    final Function sw = sWidth(context);

    return /* Container(
      child: */
        ListView.separated(
      padding: EdgeInsets.zero,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) => ChefReviewCard(),
      separatorBuilder: (BuildContext context, int index) => SizedBox(height: sh(Dimens.k24)),
      itemCount: 10,
      // ),
    );
  }
}
