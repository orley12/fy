import 'package:flutter/material.dart';
import 'package:food_yours_customer/common/widget/notification_widgets.dart';
import 'package:food_yours_customer/search_screen/screen/search_screen.dart';
import 'package:food_yours_customer/home/view_model/food_category_view_model.dart';
import 'package:food_yours_customer/home/view_model/popular_chef_view_model.dart';
import 'package:food_yours_customer/home/screen/home_screen_back_panel.dart';
import 'package:food_yours_customer/util/navigation_util.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class HomeTabController extends GetxController with SingleGetTickerProviderMixin {
  var appHomeAppbarOffset = Rx(Offset(0, 0));
  var searchScreenAppbarOffset = Rx(Offset(0, 2));
  var isShowHomeScreenAppbar = true.obs;

  late AnimationController animationCrtl = new AnimationController(
    vsync: this,
    duration: new Duration(milliseconds: 100),
    value: 1.0,
  );

  bool get isPanelVisible => animationCrtl.status == AnimationStatus.completed || animationCrtl.status == AnimationStatus.forward;

  Animation<RelativeRect> getPanelAnimation(BoxConstraints constraints) {
    final height = constraints.biggest.height;

    return new RelativeRectTween(
      begin: new RelativeRect.fromLTRB(0.0, height, 0.0, 0.0),
      end: RelativeRect.fromLTRB(0.0, 0.0, 0.0, 0.0),
    ).animate(new CurvedAnimation(parent: animationCrtl, curve: Curves.linear));
  }

  openSearchBackDrop() {
    isShowHomeScreenAppbar.value = false;
    appHomeAppbarOffset.value -= Offset(0, 2); // -2
    searchScreenAppbarOffset.value -= Offset(0, 2); // 0
    animationCrtl.fling(velocity: -1.0);
  }

  RxInt selectedFoodCategoryIndex = 0.obs;

  RxList<FoodCategoryViewModel> foodCategories = FoodCategoryViewModel.getList(null);
  RxList<PopularChefViewModel> popularChefs = PopularChefViewModel.getList(null);

  onCategorySelected(int index, FoodCategoryViewModel foodCategory) {
    selectedFoodCategoryIndex.value = index;
    push(page: SearchScreen(), arguments: foodCategory);
  }

  openAlertDialog() => showAlertDialog();

  closeSearchBackDrop() {
    isShowHomeScreenAppbar.value = true;
    appHomeAppbarOffset.value += Offset(0, 2); // 0
    searchScreenAppbarOffset.value -= Offset(0, -2); // -2
    animationCrtl.fling(velocity: 1.0);
  }
}
