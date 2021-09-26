import 'package:flutter/material.dart';
import 'package:food_yours_customer/home/view_model/food_category_view_model.dart';
import 'package:food_yours_customer/resources/integers.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';

class ChefScreenController extends GetxController with SingleGetTickerProviderMixin {
  late TabController tabController = TabController(length: Integers.chefScreenTabLength, vsync: this);
  ScrollController scrollController = ScrollController();

  late List<FoodCategoryViewModel> categories = FoodCategoryViewModel.getList(null).take(3).toList();

  late RxList<FoodCategoryViewModel> foodCategories = categories.obs;

  RxInt selectedSegment = 1.obs;
  RxInt selectedFoodCategoryIndex = 0.obs;
  RxBool isFollowed = false.obs;
  RxInt chefImageHero = 0.obs;

  onSegmentSelected(value) {
    selectedSegment.value = value;
  }

  onCategorySelected(int index, FoodCategoryViewModel foodCategory) {
    selectedFoodCategoryIndex.value = index;
  }

  toggleFollowingStatus() => isFollowed.value = !isFollowed.value;

  @override
  void onReady() {
    setGetArgument();
    super.onReady();
  }

  void setGetArgument() {
    chefImageHero.value = Get.arguments;
  }
}
