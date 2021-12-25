import 'package:flutter/material.dart';
import 'package:food_yours_customer/cart/model/cart_model.dart';
import 'package:food_yours_customer/cart/screen/cart_order_summary_screen.dart';
import 'package:food_yours_customer/common/view_model/global_objects.dart';
import 'package:food_yours_customer/common/widget/notification_widgets.dart';
import 'package:food_yours_customer/common/widget/option_item.dart';
import 'package:food_yours_customer/home/view_model/meal_view_model.dart';
import 'package:food_yours_customer/product_screen/service/product_service.dart';
import 'package:food_yours_customer/resources/enums.dart';
import 'package:food_yours_customer/resources/strings.dart';
import 'package:food_yours_customer/util/date_time_util.dart';
import 'package:get/route_manager.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:get/utils.dart';
import 'package:hive/hive.dart';

class ProductScreenController extends GetxController {
  ProductService productService = Get.find();

  Rx<MealViewModel> meal = MealViewModel().obs;
  Rx<FYOptionItem> selectedQuantity = FYOptionItem().obs;

  RxSet<FYOptionItem> selectedExtras = RxSet<FYOptionItem>();
  RxSet<FYOptionItem> selectedSuppliments = RxSet<FYOptionItem>();

  TextEditingController noteTextController = TextEditingController();

  List deliveryDays = [];
  String chefId = "";
  String chefImageUrl = "";
  RxInt cartItemsCount = 0.obs;

  onSupplimentSelected(value) {
    bool hasElement = selectedSuppliments.contains(value as FYOptionItem);
    if (hasElement) {
      return selectedSuppliments.remove(value);
    }
    selectedSuppliments.add(value);
  }

  @override
  void onReady() {
    initGetxArguments();
    initHiveData();
    super.onReady();
  }

  void initGetxArguments() {
    meal.value = Get.arguments["meal"];
    deliveryDays = Get.arguments["chefDeliveryDays"];
    chefId = Get.arguments["chefId"];
    chefImageUrl = Get.arguments["chefImageUrl"];
  }

  onExtrasSelected(value) {
    bool hasElement = selectedExtras.contains(value as FYOptionItem);
    if (hasElement) {
      return selectedExtras.remove(value);
    }
    selectedExtras.add(value);
  }

  onQuantitySelected(value) {
    selectedQuantity.value = value as FYOptionItem;
  }

  void gotoOrderSummary() {
    Get.off(() => CartOrderSummaryScreen());
  }

  void addToCart() async {
    if (GetUtils.isBlank(selectedQuantity.value.name) == true) {
      return showFYSnackBar(
          message: "Please select a quantity",
          responseGrades: ResponseGrades.ERROR);
    }
    CartModel cartModel = setRequestInformation();
    CartModel? cartItem = Hive.box(Strings.CART_BOX).get(cartModel.id);
    if (cartItem != null) {
      cartItem.count += 1;
      await Hive.box(Strings.CART_BOX).put(cartItem.id, cartItem);
    } else {
      await Hive.box(Strings.CART_BOX).put(cartModel.id, cartModel);
    }

    cartItemsCount.value += 1;
    await Hive.box(Strings.RANDOM_INFORMATION_BOX)
        .put(Strings.CART_ITEMS_COUNT, cartItemsCount.value);
  }

  CartModel setRequestInformation() {
    return CartModel(
      id: meal.value.id,
      mealName: meal.value.name,
      note: noteTextController.text,
      quantity: {
        "name": selectedQuantity.value.name,
        "price": selectedQuantity.value.value
      },
      extras: listOptionsToListMap(selectedExtras.value.toList()),
      suppliments: listOptionsToListMap(selectedSuppliments.value.toList()),
      total: calculateTotalCostOfOrder(selectedSuppliments.value.toList(),
          selectedExtras.value.toList(), selectedQuantity.value),
      count: 1,
      minimumMealPrice: double.parse(meal.value.allPrices[0].value),
      chefName: meal.value.chefName,
      address: user.value.address,
      chefDeliveryDays: deliveryDays,
      specifiedDeliveryAndTime:
          DateTimeUtil.dateTimeToString(DateTime.now().add(Duration(hours: 2))),
      chefId: chefId,
      chefImageUrl: chefImageUrl,
    );
  }

  List<Map> listOptionsToListMap(List<FYOptionItem> options) {
    return options
        .map((e) => {
              "name": e.name,
              "price": e.value,
            })
        .toList();
  }

  double calculateTotalCostOfOrder(List<FYOptionItem> suppliments,
      List<FYOptionItem> extras, FYOptionItem quantity) {
    return <FYOptionItem>[...suppliments, ...extras, quantity].fold(
        0.0,
        (double previousValue, element) =>
            (previousValue + double.parse(element.value)));
  }

  void initHiveData() async {
    cartItemsCount.value = await Hive.box(Strings.RANDOM_INFORMATION_BOX)
            .get(Strings.CART_ITEMS_COUNT) ??
        0;
  }
}
