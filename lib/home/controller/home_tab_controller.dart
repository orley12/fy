import 'package:flutter/material.dart';
import 'package:food_yours_customer/api/app_response.dart';
import 'package:food_yours_customer/auth/login/controller/login_screen_controller.dart';
import 'package:food_yours_customer/common/widget/notification_widgets.dart';
import 'package:food_yours_customer/controller/dashbard/dashboard_screen_controller.dart';
import 'package:food_yours_customer/home/service/product_service.dart';
import 'package:food_yours_customer/home/view_model/food_category_view_model.dart';
import 'package:food_yours_customer/home/view_model/popular_chef_view_model.dart';
import 'package:food_yours_customer/home/view_model/user_model.dart';
import 'package:food_yours_customer/resources/enums.dart';
import 'package:food_yours_customer/resources/strings.dart';
import 'package:food_yours_customer/search/screen/search_screen.dart';
import 'package:food_yours_customer/user/service/user_service.dart';
import 'package:food_yours_customer/user/view_model/user_view_model.dart';
import 'package:food_yours_customer/util/navigation_util.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';

Rx<UserViewModel> user = UserViewModel().obs;

class HomeTabController extends GetxController with SingleGetTickerProviderMixin {
  final DashBoardScreenController dashBoardScreenController = Get.find();
  final UserService userService = Get.find();
  final ProductService productService = Get.find();

  RxList<FoodCategoryViewModel> foodCategories = FoodCategoryViewModel.getList(null);
  RxList<PopularChefViewModel> popularChefs = PopularChefViewModel.getList(null);

  Rx<Offset> appHomeAppbarOffset = Rx(Offset(0, 0));
  Rx<Offset> searchScreenAppbarOffset = Rx(Offset(0, 2));

  RxBool isShowHomeScreenAppbar = true.obs;
  RxBool isLoadingFoodCategories = false.obs;

  String searchQuery = "";

  RxInt selectedFoodCategoryIndex = 0.obs;

//  SOME ANIMATION CODE ====================================================>
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

  closeSearchBackDrop() {
    isShowHomeScreenAppbar.value = true;
    appHomeAppbarOffset.value += Offset(0, 2);
    searchScreenAppbarOffset.value -= Offset(0, -2);
    animationCrtl.fling(velocity: 1.0);
  }
  //  SOME ANIMATION CODE ====================================================>

  onCategorySelected(int index, FoodCategoryViewModel foodCategory) {
    selectedFoodCategoryIndex.value = index;
    searchQuery = foodCategory.categoryName;
    loadFoodAllMeal();
    // push(page: SearchScreen(), arguments: foodCategory);
  }

  // openAlertDialog() => showAlertDialog();

  @override
  void onReady() async {
    await loadUserData();
    loadFoodCategories();
    super.onReady();
  }

  Future<void> loadUserData() async {
    dashBoardScreenController.isLoading.value = true;

    UserModel requestInformation = setRequestInformation();

    dashBoardScreenController.loadingMessage.value = "Fetching user data";

    AppResponse<UserViewModel> response = await userService.loadUserData(requestInformation.toJSON());

    dashBoardScreenController.isLoading.value = false;

    if (response.responseGrades == ResponseGrades.ERROR) return;

    user.value = response.data!;
  }

  UserModel setRequestInformation() {
    return UserModel(token: token);
  }

  loadFoodCategories() async {
    isLoadingFoodCategories.value = true;

    AppResponse<List<FoodCategoryViewModel>> response = await productService.loadFoodCategories({
      "sKey": Strings.apiKey,
    });

    if (response.responseGrades == ResponseGrades.ERROR) return;

    isLoadingFoodCategories.value = false;

    foodCategories.value.assignAll(response.data!);
    // foodCategories.value.
  }

  loadFoodAllMeal() async {
    dashBoardScreenController.isLoading.value = true;

    dashBoardScreenController.loadingMessage.value = "loading Meals";

    Map<String, dynamic> requestInformation = setAllMealRequestInformation();

    AppResponse response = await productService.allMeals(requestInformation);

    dashBoardScreenController.isLoading.value = false;

    showFYSnackBar(message: response.message, responseGrades: response.responseGrades);

    if (response.responseGrades == ResponseGrades.ERROR) return;

    gotoSearchScreen(response.data!);
  }

  Map<String, dynamic> setAllMealRequestInformation() {
    return {
      "categoryID": foodCategories.value[selectedFoodCategoryIndex.value].categoryId,
      "sKey": Strings.apiKey,
    };
  }

  gotoSearchScreen(meals) => push(page: SearchScreen(), arguments: {
        "meals": meals,
        "searchQuery": searchQuery,
      });
}
