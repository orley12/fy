import 'package:flutter/widgets.dart';
import 'package:food_yours_customer/api/app_response.dart';
import 'package:food_yours_customer/common/widget/notification_widgets.dart';
import 'package:food_yours_customer/home/controller/home_tab_controller.dart';
import 'package:food_yours_customer/home/view_model/meal_search_view_model.dart';
import 'package:food_yours_customer/home/view_model/meal_view_model.dart';
import 'package:food_yours_customer/product_screen/screen/product_screen.dart';
import 'package:food_yours_customer/product_screen/service/product_service.dart';
import 'package:food_yours_customer/resources/enums.dart';
import 'package:food_yours_customer/resources/strings.dart';
import 'package:food_yours_customer/search/screen/filter_screen.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:hive/hive.dart';

class HomeTabBackPanelController extends GetxController {
  late HomeTabController homeTabCrtl = Get.find<HomeTabController>();
  final ProductService productService = Get.find();

  RxBool isLoadingMeal = false.obs;
  RxString loadingMessage = "".obs;
  RxBool isLoadingSuggestions = false.obs;
  RxBool isLoadingRecentSearches = false.obs;

  TextEditingController seachQueryTextController = TextEditingController();

  clearSeachInputField() => seachQueryTextController.text = "";

  RxList<MealSearchViewModel> suggestedMeals = <MealSearchViewModel>[].obs;

  Rx<MealViewModel> meal = MealViewModel().obs;

  Rx<FocusNode> seachTextFieldFocusNode = FocusNode().obs;

  Future<Iterable<MealSearchViewModel>> loadMealSugguestions(
      String seachQuery) async {
    Map<String, dynamic> requestInformation =
        setSearchQueryInformation(seachQuery);

    isLoadingSuggestions.value = true;

    AppResponse response =
        await productService.loadMealSugguestions(requestInformation);

    isLoadingSuggestions.value = false;

    if (response.responseGrades == ResponseGrades.ERROR) {
      showFYSnackBar(
          message: response.message, responseGrades: response.responseGrades);
    }

    return suggestedMeals.value =
        (response.data as Iterable<MealSearchViewModel>).toList();
  }

  onDeleteResentSearch(int index) {
    Hive.box(Strings.SEARCH_HISTORY_BOX).delete(index);
  }

  Map<String, dynamic> setSearchQueryInformation(String seachQuery) {
    return {
      "foodName": seachQuery,
      "foodLocation": "",
      "sKey": Strings.apiKey,
    };
  }

  void onSelected(MealSearchViewModel value) {
    seachQueryTextController.text = value.name;
    Hive.box(Strings.SEARCH_HISTORY_BOX).add(value.name);
    onMealSelected(value);
  }

  gotoMealScreen() =>
      Get.to(() => ProductScreen(), arguments: {"meal": meal.value});

  onMealSelected(MealSearchViewModel selectedMeal) async {
    isLoadingMeal.value = true;

    loadingMessage.value = "Fetching meal";

    Map<String, dynamic> requestInformation =
        setRequestInformation(selectedMeal.id);

    AppResponse<MealViewModel> response =
        await productService.loadMeal(requestInformation);

    isLoadingMeal.value = false;

    if (response.responseGrades == ResponseGrades.ERROR) return;

    meal.value = response.data!;

    gotoMealScreen();
  }

  Map<String, dynamic> setRequestInformation(String id) {
    return {
      "id": id,
      "sKey": Strings.apiKey,
    };
  }

  gotoFilterScreen() {
    Get.to(() => FilterScreen(), arguments: {
      "meals": suggestedMeals.value,
    });
  }

  void gotoProductDetailsScreen(MealSearchViewModel value) {
    Get.to(() => ProductScreen(), arguments: {
      "meal": value,
    });
  }
}
