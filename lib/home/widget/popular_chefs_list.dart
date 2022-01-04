import 'package:flutter/material.dart';
import 'package:food_yours_customer/home/view_model/popular_chef_view_model.dart';
import 'package:food_yours_customer/home/widget/popular_chef_item.dart';
import 'package:food_yours_customer/home/widget/popular_chef_loading_item.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';

class PopularChefList extends StatelessWidget {
  final bool isLoading;
  final List<PopularChefViewModel> popularChefs;
  final Function(PopularChefViewModel)? onChefSelected;

  const PopularChefList({
    Key? key,
    required this.isLoading,
    required this.popularChefs,
    this.onChefSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Function sh = sHeight(context);
    final Function sw = sWidth(context);

    return Container(
      height: sh(Dimens.k141_18),
      padding: EdgeInsets.only(left: sw(Dimens.k17)),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext buildContext, int index) => isLoading
            ? PopularChefLoadingItem()
            : PopularChefItem(
                popularChefs[index],
                onChefSelected: onChefSelected,
              ),
        itemCount: popularChefs.length,
      ),
    );
  }
}
