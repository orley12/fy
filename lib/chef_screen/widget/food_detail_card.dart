import 'package:flutter/material.dart';
import 'package:food_yours_customer/chef_screen/widget/food_detail_quantity_control.dart';
import 'package:food_yours_customer/home/view_model/meal_search_view_model.dart';
import 'package:food_yours_customer/product_screen/widget/article.dart';
import 'package:food_yours_customer/resources/Images.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class FoodDetailsCard extends StatelessWidget {
  final MealSearchViewModel mealSearchViewModel;
  final int count;

  FoodDetailsCard(this.mealSearchViewModel, this.count);

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
                  ClipRRect(
                    borderRadius: BorderRadius.circular(Dimens.k8),
                    child: FadeInImage.assetNetwork(
                      height: sh(124),
                      width: sw(303),
                      placeholder: Images.popular_chef,
                      image: mealSearchViewModel.mealImage,
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              ),
              SizedBox(height: sh(Dimens.k12)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Article(
                      descriptionFontSize: Dimens.k12,
                      title: "${mealSearchViewModel.name}",
                      description:
                          "A meal of pounded yam and melon soup, a traditional meal for the yorubas in the western part of Nigeria.."),
                ],
              ),
              SizedBox(height: sh(Dimens.k17)),
              RichText(
                textAlign: TextAlign.start,
                text: TextSpan(children: <TextSpan>[
                  TextSpan(
                    style: context.theme.textTheme.caption!.copyWith(
                        fontSize: Dimens.k12, fontWeight: FontWeight.w600),
                    text: "From  ",
                  ),
                  TextSpan(
                    style: context.theme.textTheme.headline3!
                        .copyWith(fontSize: Dimens.k16),
                    text: "N${mealSearchViewModel.lowestPrice}",
                  ),
                ]),
              ),
              SizedBox(height: sh(4.47)),
              Divider(thickness: 0.19, height: 0),
              SizedBox(height: sh(5.67)),
              Container(
                height: sh(34.74),
                child: FoodDetailQuantityControl(mealSearchViewModel, count),
              ),
              SizedBox(height: sh(16.21)),
            ],
          ),
        ),
      ),
    );
  }
}
