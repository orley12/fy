import 'package:food_yours_customer/resources/Images.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class FoodCategoryViewModel {
  String categoryImagePath = "";
  String categoryName = "";

  FoodCategoryViewModel();

  FoodCategoryViewModel.fromJson(Map<String, dynamic>? json)
      : categoryName = json?["categoryName"] ?? "",
        categoryImagePath = json?["categoryImagePath"] ?? "";

  static getList(List<dynamic>? json) {
    List<Map<String, dynamic>> foodCategories = List<Map<String, dynamic>>.from(json ?? categories);
    return List.generate(foodCategories.length, (index) => FoodCategoryViewModel.fromJson(foodCategories[index])).obs;
  }
}

List categories = [
  {"categoryName": "African", "categoryImagePath": Images.food_category},
  {"categoryName": "Breakfast", "categoryImagePath": Images.food_category},
  {"categoryName": "Grill", "categoryImagePath": Images.food_category},
  {"categoryName": "Continental", "categoryImagePath": Images.food_category},
  {"categoryName": "Fast Food", "categoryImagePath": Images.food_category},
  {"categoryName": "Drinks", "categoryImagePath": Images.food_category}
];
