import 'package:flutter/material.dart';
import 'package:food_yours_customer/common/widget/app_button.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class PartnerWithUsCard extends StatelessWidget {
  final String image;
  final String subTitle;
  final String title;

  PartnerWithUsCard({required this.image, required this.subTitle, required this.title});

  @override
  Widget build(BuildContext context) {
    Function sh = sHeight(context);
    Function sw = sWidth(context);

    return ClipRRect(
      borderRadius: BorderRadius.circular(Dimens.k12),
      child: Card(
        elevation: 0,
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(Dimens.k12)),
          padding: EdgeInsets.only(left: sw(12), right: sw(12), top: sw(12)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FYButton(
                onTap: () {},
                child: Container(
                    height: sh(124),
                    width: sw(303),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimens.k8),
                        image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover))),
              ),
              SizedBox(height: sh(Dimens.k12)),
              buildProductNameAndPriceColumn(context, sh),
              SizedBox(height: sh(Dimens.k8)),
            ],
          ),
        ),
      ),
    );
  }

  Column buildProductNameAndPriceColumn(BuildContext context, Function sh) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        title,
        style: context.theme.textTheme.headline2!.copyWith(fontSize: sh(Dimens.k16)),
      ),
      SizedBox(height: sh(Dimens.k8)),
      Text(
        subTitle,
        style: context.theme.textTheme.caption!
            .copyWith(fontSize: sh(Dimens.k12), fontWeight: FontWeight.w400, color: FYColors.lighterBlack2),
      ),
    ]);
  }
}
