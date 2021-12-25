import 'package:dio/dio.dart';
import 'package:food_yours_customer/api/api.dart';
import 'package:food_yours_customer/api/api_routes.dart';
import 'package:food_yours_customer/chef_screen/repository/chef_repository.dart';
import 'package:food_yours_customer/main/main_common.dart';

class ChefRepositoryImpl implements ChefRepository {
  late ApiClient apiClient = api.clone();

  @override
  loadChef(Map<String, dynamic> requestInformation) async {
    try {
      return await apiClient.dio!.post(Routes.chef, data: requestInformation);
    } on DioError catch (e) {
      return apiClient.handleError(e);
    }
  }

  @override
  loadMealsByChef(Map<String, dynamic> requestInformation) async {
    try {
      return await apiClient.dio!
          .post(Routes.chefMeals, data: requestInformation);
    } on DioError catch (e) {
      return apiClient.handleError(e);
    }
  }

  @override
  loadChefReviews(Map<String, dynamic> requestInformation) async {
    try {
      return await apiClient.dio!
          .post(Routes.chefReviews, data: requestInformation);
    } on DioError catch (e) {
      return apiClient.handleError(e);
    }
  }

  @override
  rateChef(Map<String, dynamic> requestInformation) async {
    try {
      return await apiClient.dio!
          .post(Routes.rateChef, data: requestInformation);
    } on DioError catch (e) {
      return apiClient.handleError(e);
    }
  }
}
