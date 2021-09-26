import 'package:food_yours_customer/resources/Images.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class PopularChefViewModel {
  String popularChefImagePath;
  String foodCategory;
  double startingPrice;
  String chefName;
  String kitchenAddress;
  List<String> daysOfWeek;
  double ratings;

  PopularChefViewModel.fromJson(Map<String, dynamic>? json)
      : popularChefImagePath = json?["popularChefImagePath"] ?? "",
        foodCategory = json?["foodCategory"] ?? "",
        startingPrice = json?["startingPrice"] ?? 0.0,
        chefName = json?["chefName"] ?? "",
        kitchenAddress = json?["kitchenAddress"] ?? "",
        daysOfWeek = json?["daysOfWeek"] ?? ["M"],
        ratings = json?["ratings"] ?? 0.0;

  static getList(List<dynamic>? json) {
    List<Map<String, dynamic>> popularChefs = List<Map<String, dynamic>>.from(json ?? listPopularChefs);
    return List.generate(popularChefs.length, (index) => PopularChefViewModel.fromJson(popularChefs[index])).obs;
  }
}

List listPopularChefs = [
  {
    "chefName": "Omowunmi O.",
    "popularChefImagePath": Images.popular_chef,
    "foodCategory": "African",
    "kitchenAddress": "Gwarinpa, Abuja.",
    "ratings": 5.0,
    "daysOfWeek": ["M"]
  },
  {
    "chefName": "Emmanuel A.",
    "popularChefImagePath": Images.popular_chef,
    "foodCategory": "African",
    "kitchenAddress": "Gwarinpa, Abuja.",
    "ratings": 5.0,
    "daysOfWeek": ["M", "T", "W", "Th", "F"]
  },
  {
    "chefName": "Juliet R.",
    "popularChefImagePath": Images.popular_chef,
    "foodCategory": "African",
    "kitchenAddress": "Gwarinpa, Abuja.",
    "ratings": 5.0,
    "daysOfWeek": ["M", "T", "W", "Th", "F"]
  },
  {
    "chefName": "Omowunmi O.",
    "popularChefImagePath": Images.popular_chef,
    "foodCategory": "African",
    "kitchenAddress": "Gwarinpa, Abuja.",
    "ratings": 5.0,
    "daysOfWeek": ["M", "T", "W", "Th", "F"]
  },
  {
    "chefName": "Emmanuel A.",
    "popularChefImagePath": Images.popular_chef,
    "foodCategory": "African",
    "kitchenAddress": "Gwarinpa, Abuja.",
    "ratings": 5.0,
    "daysOfWeek": ["M", "T", "W", "Th", "F"]
  },
  {
    "chefName": "Juliet R.",
    "popularChefImagePath": Images.popular_chef,
    "foodCategory": "African",
    "kitchenAddress": "Gwarinpa, Abuja.",
    "ratings": 5.0,
    "daysOfWeek": ["M", "T", "W", "Th", "F"]
  }
];
