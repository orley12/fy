import 'package:flutter/material.dart';
import 'package:food_yours_customer/chef_screen/screen/chef_screen.dart';
import 'package:food_yours_customer/home/view_model/food_category_view_model.dart';
import 'package:food_yours_customer/home/view_model/meal_view_model.dart';
import 'package:food_yours_customer/product_screen/screen/product_screen.dart';
import 'package:food_yours_customer/search/screen/filter_screen.dart';
import 'package:food_yours_customer/util/navigation_util.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';

class SearchScreenController extends GetxController {
  RxList<MealViewModel> meals = <MealViewModel>[].obs;
  Rx<FoodCategoryViewModel> foodCategory = FoodCategoryViewModel().obs;

  TextEditingController searchTextEditingController = TextEditingController();

  @override
  void onReady() {
    setGetArguments();
    super.onReady();
  }

  void setGetArguments() {
    meals.assignAll(Get.arguments["meals"]);
    searchTextEditingController.text = Get.arguments["searchQuery"];
  }

  goToChefProfile() => push(page: ChefScreen());

  gotoFilterScreen() => push(page: FilterScreen());

  gotoMealScreen(MealViewModel meal) => push(page: ProductScreen(), arguments: {"meal": meal});
}
