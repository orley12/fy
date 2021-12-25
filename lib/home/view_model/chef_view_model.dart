class ChefViewModel {
  String id;
  List deliveryDays;
  String chefName;
  String chefImage;
  String rating;
  String chefID;
  String chefsTags;
  String deliveryTime;

  ChefViewModel({
    this.id = "",
    this.deliveryDays = const [],
    this.chefName = "",
    this.chefImage = "https://foodyours.com/views/assets/img/bg.png",
    this.rating = "",
    this.chefID = "",
    this.chefsTags = "",
    this.deliveryTime = "",
  });

  ChefViewModel.fromJson(Map<String, dynamic>? json)
      : id = json?['id'] ?? "",
        deliveryDays = json?['deliveryDays'] ?? [],
        chefName = json?['chefName'] ?? "",
        chefImage = json?['chefImage'] ?? "",
        rating = json?['rating'] ?? "",
        chefID = json?['chefID'] ?? "",
        chefsTags = json?['chefsTags'] ?? "",
        deliveryTime = json?['deliveryTime'] ?? "";

  @override
  String toString() {
    return 'MealViewModel{id: $id, deliveryDays: $deliveryDays, chefName: $chefName, chefImage: $chefImage, rating: $rating, chefID: $chefID, chefName: $chefName, chefsTags: $chefsTags, deliveryTime: $deliveryTime}';
  }
}
