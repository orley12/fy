import 'package:dio/dio.dart';
import 'package:food_yours_customer/api/app_response.dart';
import 'package:food_yours_customer/home/repository/product_repository.dart';
import 'package:food_yours_customer/home/view_model/food_category_view_model.dart';
import 'package:food_yours_customer/home/view_model/meal_view_model.dart';
import 'package:food_yours_customer/resources/enums.dart';
import 'package:get/instance_manager.dart';

class ProductService {
  final ProductRepository productRepository = Get.find();

  loadFoodCategories(Map<String, dynamic> requestInformation) async {
    Response response = await productRepository.loadFoodCategories(requestInformation);

    List<dynamic> responseBody = response.data;

    if (response.data is List && response.statusCode! >= 200 && response.statusCode! <= 300) {
      return AppResponse<List<FoodCategoryViewModel>>(
          ResponseGrades.SUCCESS, response.statusCode!, "Success", FoodCategoryViewModel.getList(responseBody));
    }
    return AppResponse<List<FoodCategoryViewModel>>(ResponseGrades.ERROR, response.statusCode!, "An error occurred");
  }

  allMeals(Map<String, dynamic> requestInformation) async {
    Response response = await productRepository.loadAllMeals(requestInformation);

    if (response.data is List && response.statusCode! >= 200 && response.statusCode! <= 300) {
      return AppResponse(ResponseGrades.SUCCESS, response.statusCode!, "Success", MealViewModel.getList(response.data));
    }
    return AppResponse(ResponseGrades.ERROR, response.statusCode!, "An error occurred");
  }
}
