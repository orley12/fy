import 'package:dio/dio.dart';
import 'package:food_yours_customer/api/api.dart';
import 'package:food_yours_customer/api/api_routes.dart';
import 'package:food_yours_customer/home/repository/product_repository.dart';
import 'package:food_yours_customer/main/main_common.dart';

class ProductRepositoryImpl implements ProductRepository {
  late ApiClient apiClient = api.clone();

  @override
  loadFoodCategories(Map<String, dynamic> requestInformation) async {
    try {
      return await apiClient.dio!.post(Routes.foodCategories, data: requestInformation);
    } on DioError catch (e) {
      return apiClient.handleError(e);
    }
  }

  @override
  loadAllMeals(Map<String, dynamic> requestInformation) async {
    try {
      return await apiClient.dio!.post(Routes.allMeals, data: requestInformation);
    } on DioError catch (e) {
      return apiClient.handleError(e);
    }
  }
}
