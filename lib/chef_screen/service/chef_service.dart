import 'package:dio/dio.dart';
import 'package:food_yours_customer/api/app_response.dart';
import 'package:food_yours_customer/chef_screen/repository/chef_repository.dart';
import 'package:food_yours_customer/home/view_model/chef_review_view_modal.dart';
import 'package:food_yours_customer/home/view_model/chef_view_model.dart';
import 'package:food_yours_customer/home/view_model/meal_search_view_model.dart';
import 'package:food_yours_customer/resources/enums.dart';
import 'package:get/instance_manager.dart';

class ChefService {
  final ChefRepository chefRepository = Get.find();

  loadChef(Map<String, dynamic> requestInformation) async {
    Response response = await chefRepository.loadChef(requestInformation);

    if (response.statusCode! >= 200 && response.statusCode! <= 300) {
      return AppResponse<ChefViewModel>(
          ResponseGrades.SUCCESS,
          response.statusCode!,
          "Success",
          ChefViewModel.fromJson(response.data[0]));
    }
    return AppResponse<ChefViewModel>(
        ResponseGrades.ERROR, response.statusCode!, "An error occurred");
  }

  loadMealsByChef(Map<String, dynamic> requestInformation) async {
    Response response =
        await chefRepository.loadMealsByChef(requestInformation);

    if (response.statusCode! >= 200 && response.statusCode! <= 300) {
      return AppResponse<List<MealSearchViewModel>>(
          ResponseGrades.SUCCESS,
          response.statusCode!,
          "Success",
          MealSearchViewModel.getList(response.data));
    }
    return AppResponse<List<MealSearchViewModel>>(
        ResponseGrades.ERROR, response.statusCode!, "An error occurred");
  }

  loadChefReviews(Map<String, dynamic> requestInformation) async {
    Response response =
        await chefRepository.loadChefReviews(requestInformation);

    if (response.statusCode! >= 200 && response.statusCode! <= 300) {
      return AppResponse<List<ChefReviewViewModel>>(
          ResponseGrades.SUCCESS,
          response.statusCode!,
          "Success",
          ChefReviewViewModel.getList(response.data));
    }
    return AppResponse<List<ChefReviewViewModel>>(
        ResponseGrades.ERROR, response.statusCode!, "An error occurred");
  }

  rateChef(Map<String, dynamic> requestInformation) async {
    Response response = await chefRepository.rateChef(requestInformation);

    if (response.statusCode! >= 200 && response.statusCode! <= 300) {
      return AppResponse<List<ChefReviewViewModel>>(
          ResponseGrades.SUCCESS, response.statusCode!, "Success");
    }
    return AppResponse<List<ChefReviewViewModel>>(
        ResponseGrades.ERROR, response.statusCode!, "An error occurred");
  }
}
