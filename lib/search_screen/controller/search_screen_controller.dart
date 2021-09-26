import 'package:flutter/material.dart';
import 'package:food_yours_customer/chef_screen/screen/chef_screen.dart';
import 'package:food_yours_customer/chef_screen/widget/food_detail_card.dart';
import 'package:food_yours_customer/home/view_model/food_category_view_model.dart';
import 'package:food_yours_customer/product_screen/screen/product_screen.dart';
import 'package:food_yours_customer/search_screen/screen/filter_screen.dart';
import 'package:food_yours_customer/util/navigation_util.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';

class SearchScreenController extends GetxController {
  Rx<FoodCategoryViewModel> foodCategory = FoodCategoryViewModel().obs;

  TextEditingController searchTextEditingController = TextEditingController();

  @override
  void onReady() {
    setFoodCategory();
    super.onReady();
  }

  void setFoodCategory() {
    foodCategory.value = Get.arguments;
    searchTextEditingController.text = foodCategory.value.categoryName;
  }

  goToChefProfile() => push(page: ChefScreen());

  gotoFilterScreen() => push(page: FilterScreen());

  gotoFoodScreen() => push(page: ProductScreen());
}
