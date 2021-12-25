import 'package:food_yours_customer/common/view_model/selectable.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import '/util/string_extension.dart';

class MealSearchViewModel implements Selectable {
  String name;
  String id;
  String mealImage;
  String lowestPrice;
  String deliveryDays;
  String chefName;
  String chefImage;
  String rating;
  String chefID;
  int distance;

  MealSearchViewModel([
    this.name = "",
    this.id = "",
    this.mealImage = "",
    this.lowestPrice = "",
    this.deliveryDays = "",
    this.chefName = "",
    this.chefImage = "",
    this.rating = "0",
    this.chefID = "",
    this.distance = 0,
  ]);

  MealSearchViewModel.fromJson(Map<String, dynamic>? json)
      : id = json?["id"] ?? "",
        name = json?["mealName"] ?? "",
        mealImage = json?["mealPic"] ?? "",
        lowestPrice = json?["lowestPrice"] ?? "",
        deliveryDays = json?["deliveryDays"]
            .map((e) => (e as String).toUpperCase().first)
            .join(", "),
        chefName = json?["chefName"] ?? "",
        chefImage = json?["chefImage"] ?? "",
        rating = json?["rating"] ?? "0",
        chefID = json?["chefID"] ?? "",
        distance = json?["distance"] ?? 0;

  static getList(List? json) {
    List<Map<String, dynamic>> meals =
        List<Map<String, dynamic>>.from(json ?? []);
    return List.generate(
            meals.length, (index) => MealSearchViewModel.fromJson(meals[index]))
        .obs;
  }
}
