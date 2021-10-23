import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:food_yours_customer/common/widget/app_button.dart';
import 'package:food_yours_customer/home/view_model/meal_view_model.dart';
import 'package:food_yours_customer/home/widget/food_category_label.dart';
import 'package:food_yours_customer/resources/Images.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/resources/icons.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class SearchResultCard extends StatelessWidget {
  final MealViewModel mealViewModel;
  final Function onChefPressed;
  final Function onMealPressed;

  SearchResultCard({required this.mealViewModel, required this.onChefPressed, required this.onMealPressed});

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
                    onTap: () => onMealPressed(mealViewModel),
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
                  Positioned(
                    top: sh(11),
                    left: -sw(6),
                    child: Container(
                        width: sw(92.86),
                        height: sh(22.74),
                        child: CardStripe(
                          Row(
                            children: [
                              SizedBox(width: sw(10)),
                              RichText(
                                textAlign: TextAlign.start,
                                text: TextSpan(children: <TextSpan>[
                                  TextSpan(
                                    style: context.theme.textTheme.caption!.copyWith(
                                        fontSize: sh(Dimens.k12), fontWeight: FontWeight.w600, color: FYColors.darkerBlack),
                                    text: "DD: ",
                                  ),
                                  TextSpan(
                                    style: context.theme.textTheme.headline3!
                                        .copyWith(fontSize: sh(Dimens.k12), color: FYColors.mainBlue),
                                    text: /* mealViewModel.daysOfWeek */ "",
                                  ),
                                ]),
                              ),
                            ],
                          ),
                        )),
                  ),
                ],
              ),
              SizedBox(height: sh(Dimens.k12)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  buildProductNameAndPriceColumn(context, sh, sw),
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
        onTap: () => onChefPressed());
  }

  Column buildProductNameAndPriceColumn(BuildContext context, Function sh, Function sw) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SizedBox(
        width: sw(200),
        child: AutoSizeText(
          mealViewModel.productName,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: context.theme.textTheme.headline2!.copyWith(fontSize: sh(Dimens.k16)),
        ),
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
              text: /* mealViewModel.priceArray */ "",
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
          mealViewModel.vendorLocation,
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
              "${mealViewModel.rating}(22)",
              textAlign: TextAlign.end,
              style: context.theme.textTheme.headline3!.copyWith(fontSize: Dimens.k12),
            )
          ],
        ),
      ],
    );
  }
}
