import 'package:dio/dio.dart';
import 'package:food_yours_customer/api/api.dart';
import 'package:food_yours_customer/api/api_routes.dart';
import 'package:food_yours_customer/login/repository/auth_repository.dart';
import 'package:food_yours_customer/main/main_common.dart';

class AuthRepositoryImpl implements AuthRepository {
  late ApiClient apiClient = api.clone();

  @override
  signUp(Map<String, dynamic> registrationInformation) async {
    try {
      return await apiClient.dio!.post(Routes.registration, data: registrationInformation);
    } on DioError catch (e) {
      return apiClient.handleError(e);
    }
  }

  @override
  login(Map<String, dynamic> loginInformation) async {
    try {
      return await apiClient.dio!.post(Routes.login, data: loginInformation);
    } on DioError catch (e) {
      return apiClient.handleError(e);
    }
  }
}
