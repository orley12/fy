import 'package:dio/dio.dart';
import 'package:food_yours_customer/api/api.dart';
import 'package:food_yours_customer/api/api_routes.dart';
import 'package:food_yours_customer/auth/repository/auth_repository.dart';
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

  @override
  initiatePasswordReset(Map<String, dynamic> passwordResetInformation) async {
    try {
      return await apiClient.dio!.post(Routes.initiatePasswordReset, data: passwordResetInformation);
    } on DioError catch (e) {
      return apiClient.handleError(e);
    }
  }
}
