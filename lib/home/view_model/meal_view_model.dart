import 'package:food_yours_customer/common/view_model/selectable.dart';
import 'package:food_yours_customer/common/widget/option_item.dart';

class MealViewModel implements Selectable {
  String id;
  String name;
  String mealPic;
  List<FYOptionItem> allPrices;
  List<FYOptionItem> extras;
  List<FYOptionItem> suppliments;
  String ingerdients;
  String chefName;
  String measure;
  String description;
  List tags;

  MealViewModel({
    this.id = "",
    this.name = "",
    this.mealPic = "https://foodyours.com/views/assets/img/bg.png",
    this.allPrices = const [],
    this.extras = const [],
    this.suppliments = const [],
    this.ingerdients = "",
    this.chefName = "",
    this.measure = "",
    this.description = "",
    this.tags = const [],
  });

  MealViewModel.fromJson(Map<String, dynamic>? json)
      : id = json?['id'] ?? "",
        name = json?['mealName'] ?? "",
        mealPic = json?['mealPic'] ?? "",
        allPrices = json?['allPrices'] == null
            ? []
            : (json?['allPrices'] as Map)
                .map((key, value) =>
                    MapEntry(key, FYOptionItem("$key $value", value)))
                .values
                .toList(),
        extras = json?['extras'] == null
            ? []
            : (json?['extras'] as Map)
                .map((key, value) =>
                    MapEntry(key, FYOptionItem("$key @ $value", value)))
                .values
                .toList(),
        suppliments = json?['suppliments'] == null
            ? []
            : (json?['suppliments'] as Map)
                .map((key, value) =>
                    MapEntry(key, FYOptionItem("$key @ $value", value)))
                .values
                .toList(),
        ingerdients = json?['ingerdients'].fold(
                "", (previousValue, element) => "$previousValue $element,") ??
            [],
        tags = json?['tags'] ?? ["Spicy", "African"],
        chefName = json?['chefName'] ?? "",
        description = json?['Descriptions'] ??
            "The nigerian jollof rice is known all over for it’s sweet sentilating and peppery feel, a must taste.",
        measure = json?['measure'] ?? "";

  @override
  String toString() {
    return 'MealViewModel{id: $id, name: $name, mealPic: $mealPic, allPrices: $allPrices, extras: $extras, suppliments: $suppliments, ingerdients: $ingerdients, chefName: $chefName, measure: $measure, description: $description, tags: $tags}';
  }
}
