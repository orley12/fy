import 'package:food_yours_customer/home/view_model/meal_view_model.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';

class ProductScreenController extends GetxController {
  Rx<MealViewModel> meal = MealViewModel().obs;

  @override
  void onReady() {
    initGetxArguments();
    super.onReady();
  }

  void initGetxArguments() {
    meal.value = Get.arguments["meal"];
  }
}
