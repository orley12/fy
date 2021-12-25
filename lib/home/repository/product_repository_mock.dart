import 'package:food_yours_customer/home/repository/product_repository.dart';

class ProductRepositoryMock implements ProductRepository {
  loadFoodCategories(Map<String, dynamic> requestInformation) {}

  @override
  loadAllMealUnderSelectedCategory(Map<String, dynamic> requestInformation) {}

  @override
  loadMealSugguestions(Map<String, dynamic> requestInformation) {}

  @override
  loadMeal(Map<String, dynamic> requestInformation) {
    // TODO: implement loadMealData
    throw UnimplementedError();
  }

  @override
  getDeliveryPrice() {
    // TODO: implement getDeliveryPrice
    throw UnimplementedError();
  }

  @override
  loadChef(Map<String, dynamic> requestInformation) {
    // TODO: implement loadChef
    throw UnimplementedError();
  }

  @override
  loadMealsByChef(Map<String, dynamic> requestInformation) {
    // TODO: implement loadMealsByChef
    throw UnimplementedError();
  }

  @override
  loadChefReviews(Map<String, dynamic> requestInformation) {
    // TODO: implement loadChefReviews
    throw UnimplementedError();
  }
}
