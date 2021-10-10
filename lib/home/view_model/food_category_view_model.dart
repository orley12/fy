import 'package:food_yours_customer/resources/Images.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class FoodCategoryViewModel {
  String categoryImage;
  String categoryName;
  String categoryId;

  FoodCategoryViewModel({this.categoryImage = "", this.categoryName = "", this.categoryId = ""});

  FoodCategoryViewModel.fromJson(Map<String, dynamic>? json)
      : categoryId = json?["categoryID"] ?? "",
        categoryName = json?["category"] ?? "",
        categoryImage = /* json?["categoryImage"] ?? */ "https://foodyours.com/views/assets/img/bg.png";

  static getList(List? json) {
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
