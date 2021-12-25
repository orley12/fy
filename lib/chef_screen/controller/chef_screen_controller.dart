import 'package:flutter/material.dart';
import 'package:food_yours_customer/api/app_response.dart';
import 'package:food_yours_customer/cart/model/cart_model.dart';
import 'package:food_yours_customer/cart/screen/cart_order_summary_screen.dart';
import 'package:food_yours_customer/chef_screen/service/chef_service.dart';
import 'package:food_yours_customer/common/view_model/global_objects.dart';
import 'package:food_yours_customer/common/widget/option_item.dart';
import 'package:food_yours_customer/home/view_model/chef_review_view_modal.dart';
import 'package:food_yours_customer/home/view_model/chef_view_model.dart';
import 'package:food_yours_customer/home/view_model/food_category_view_model.dart';
import 'package:food_yours_customer/home/view_model/meal_search_view_model.dart';
import 'package:food_yours_customer/home/view_model/meal_view_model.dart';
import 'package:food_yours_customer/product_screen/screen/product_screen.dart';
import 'package:food_yours_customer/product_screen/service/product_service.dart';
import 'package:food_yours_customer/resources/enums.dart';
import 'package:food_yours_customer/resources/integers.dart';
import 'package:food_yours_customer/resources/strings.dart';
import 'package:food_yours_customer/util/date_time_util.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:hive/hive.dart';

class ChefScreenController extends GetxController
    with SingleGetTickerProviderMixin {
  ProductService productService = Get.find();
  ChefService chefService = Get.find();

  RxBool isLoading = false.obs;
  RxString loadingMessage = "".obs;

  RxInt cartItemsCount = 0.obs;

  late TabController tabController =
      TabController(length: Integers.chefScreenTabLength, vsync: this);
  ScrollController scrollController = ScrollController();

  late List<FoodCategoryViewModel> categories =
      FoodCategoryViewModel.getList(null).take(3).toList();

  late RxList<FoodCategoryViewModel> foodCategories = categories.obs;

  late RxList<ChefReviewViewModel> chefReviews = <ChefReviewViewModel>[].obs;

  RxInt selectedSegment = 1.obs;
  RxInt selectedFoodCategoryIndex = 0.obs;
  RxBool isFollowed = false.obs;

  Rx<ChefViewModel> chef = ChefViewModel().obs;
  RxList<MealSearchViewModel> chefMeals = <MealSearchViewModel>[].obs;
  MealViewModel meal = MealViewModel();

  RxList tags = [].obs;

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
    initHiveData();
    super.onReady();
  }

  void setGetArgument() {
    chef.value = Get.arguments["chef"];
    tags.value = chef.value.chefsTags.split(",");
    loadMealsByChef();
  }

  void initHiveData() async {
    cartItemsCount.value = await Hive.box(Strings.RANDOM_INFORMATION_BOX)
            .get(Strings.CART_ITEMS_COUNT) ??
        0;
  }

  increaseItemQuantity(int indexOfCartItem) {
    CartModel cartItem = Hive.box(Strings.CART_BOX).getAt(indexOfCartItem);
    cartItem..count += 1;
    Hive.box(Strings.CART_BOX).delete(indexOfCartItem);
    Hive.box(Strings.CART_BOX).put(indexOfCartItem, cartItem);
    int cartItemsCount =
        Hive.box(Strings.RANDOM_INFORMATION_BOX).get(Strings.CART_ITEMS_COUNT);
    Hive.box(Strings.RANDOM_INFORMATION_BOX)
        .put(Strings.CART_ITEMS_COUNT, cartItemsCount += 1);
  }

  decreaseItemQuantity(int indexOfCartItem) {
    CartModel cartItem = Hive.box(Strings.CART_BOX).getAt(indexOfCartItem);

    if (cartItem.count < 1) {
      Hive.box(Strings.CART_BOX).delete(indexOfCartItem);
      Hive.box(Strings.CART_BOX).compact();
      return;
    }
    Hive.box(Strings.CART_BOX).put(indexOfCartItem, cartItem..count -= 1);
    int cartItemsCount =
        Hive.box(Strings.RANDOM_INFORMATION_BOX).get(Strings.CART_ITEMS_COUNT);
    Hive.box(Strings.RANDOM_INFORMATION_BOX)
        .put(Strings.CART_ITEMS_COUNT, cartItemsCount -= 1);
  }

  loadMealsByChef() async {
    isLoading.value = true;

    Map<String, dynamic> requestInformation =
        setMealsByChefRequestInformation();

    AppResponse<List<MealSearchViewModel>> response =
        await chefService.loadMealsByChef(requestInformation);

    isLoading.value = false;

    if (response.responseGrades == ResponseGrades.ERROR) return;

    chefMeals.value = response.data!;
  }

  Map<String, dynamic> setMealsByChefRequestInformation() {
    return {
      "chefID": chef.value.chefID,
      "sKey": Strings.apiKey,
    };
  }

  loadChefReviews() async {
    isLoading.value = true;

    Map<String, dynamic> requestInformation =
        setChefReviewsRequestInformation();

    AppResponse<List<ChefReviewViewModel>> response =
        await chefService.loadChefReviews(requestInformation);

    isLoading.value = false;

    if (response.responseGrades == ResponseGrades.ERROR) return;

    chefReviews.value = response.data!;
  }

  Map<String, dynamic> setChefReviewsRequestInformation() {
    return {
      "chefID": chef.value.chefID,
      "sKey": Strings.apiKey,
    };
  }

  addItemToCart(MealSearchViewModel mealSearchViewModel) {
    CartModel? cartItem =
        Hive.box(Strings.CART_BOX).get(mealSearchViewModel.id);
    if (cartItem != null) {
      cartItem.count += 1;
      Hive.box(Strings.CART_BOX).put(cartItem.id, cartItem);
    } else {
      CartModel cartModel = generateCartModel(mealSearchViewModel);
      Hive.box(Strings.CART_BOX).put(cartModel.id, cartModel);
    }
    int cartItemsCount = Hive.box(Strings.RANDOM_INFORMATION_BOX)
            .get(Strings.CART_ITEMS_COUNT) ??
        0;
    Hive.box(Strings.RANDOM_INFORMATION_BOX)
        .put(Strings.CART_ITEMS_COUNT, cartItemsCount += 1);
  }

  removeItemfromCart(MealSearchViewModel mealSearchViewModel) {
    CartModel? cartItem =
        Hive.box(Strings.CART_BOX).get(mealSearchViewModel.id);
    if (cartItem != null) {
      cartItem.count -= 1;
      Hive.box(Strings.CART_BOX).put(cartItem.id, cartItem);
    }

    int cartItemsCount =
        Hive.box(Strings.RANDOM_INFORMATION_BOX).get(Strings.CART_ITEMS_COUNT);
    Hive.box(Strings.RANDOM_INFORMATION_BOX)
        .put(Strings.CART_ITEMS_COUNT, cartItemsCount -= 1);
  }

  CartModel generateCartModel(MealSearchViewModel mealModel) {
    return CartModel(
      id: mealModel.id,
      mealName: mealModel.name,
      note: "",
      quantity: {"name": mealModel.name, "price": mealModel.lowestPrice},
      suppliments: [],
      extras: [],
      total: calculateTotalCostOfOrder(
          [],
          [],
          FYOptionItem(
              mealModel.name, mealModel.lowestPrice.replaceFirst(",", ""))),
      count: 1,
      minimumMealPrice:
          double.parse(mealModel.lowestPrice.replaceFirst(",", "")),
      chefName: mealModel.chefName,
      address: user.value.address,
      chefDeliveryDays: chef.value.deliveryDays,
      specifiedDeliveryAndTime:
          DateTimeUtil.dateTimeToString(DateTime.now().add(Duration(hours: 2))),
      chefId: chef.value.id,
      chefImageUrl: chef.value.chefImage,
    );
  }

  double calculateTotalCostOfOrder(List<FYOptionItem> suppliments,
      List<FYOptionItem> extras, FYOptionItem quantity) {
    return <FYOptionItem>[...suppliments, ...extras, quantity].fold(
        0.0,
        (double previousValue, element) =>
            (previousValue + double.parse(element.value)));
  }

  loadMeal(MealSearchViewModel selectedMeal) async {
    isLoading.value = true;

    loadingMessage.value = "Fetching meal";

    Map<String, dynamic> requestInformation =
        setRequestMealInformation(selectedMeal.id);

    AppResponse<MealViewModel> response =
        await productService.loadMeal(requestInformation);

    isLoading.value = false;

    if (response.responseGrades == ResponseGrades.ERROR) return;

    meal = response.data!;

    gotoProductScreen();
  }

  gotoProductScreen() {
    Get.to(() => ProductScreen(), arguments: {"meal": meal});
  }

  Map<String, dynamic> setRequestMealInformation(String mealId) {
    return {
      "id": mealId,
      "sKey": Strings.apiKey,
    };
  }

  void gotoOrderSummary() {
    Get.off(() => CartOrderSummaryScreen(),
        arguments: {"chef": Get.arguments["chef"]});
  }
}
