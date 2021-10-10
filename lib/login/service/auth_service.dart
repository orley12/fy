import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:food_yours_customer/api/app_response.dart';
import 'package:food_yours_customer/common/repository/preference_repository.dart';
import 'package:food_yours_customer/login/repository/auth_repository.dart';
import 'package:food_yours_customer/resources/strings.dart';
import 'package:food_yours_customer/resources/enums.dart';
import 'package:get/instance_manager.dart';

class AuthService {
  AuthRepository authRepository = Get.find<AuthRepository>();
  PreferenceRepository preferenceRepository = Get.find();

  signUp(Map<String, dynamic> registrationInformation) async {
    Response response = await authRepository.signUp(registrationInformation);

    Map<String, dynamic> responseBody = response.data;

    if (responseBody["code"] >= 200 && responseBody["code"] <= 300) {
      updateStageOfUsage();
      return AppResponse(ResponseGrades.SUCCESS, responseBody["code"], responseBody["message"]);
    }
    return AppResponse(ResponseGrades.ERROR, responseBody["code"], responseBody["message"]);
  }

  void updateStageOfUsage() {
    preferenceRepository.setStringPref(Strings.stageOfUSage, StageOfUsage.REGISTERED.toString());
  }

  login(Map<String, dynamic> loginInformation) async {
    Response response = await authRepository.login(loginInformation);

    Map<String, dynamic> responseBody = response.data;

    if (responseBody["code"] >= 200 && responseBody["code"] <= 300) {
      return AppResponse(ResponseGrades.SUCCESS, responseBody["code"], responseBody["message"]);
    }
    return AppResponse(ResponseGrades.ERROR, responseBody["code"], responseBody["message"]);
  }
}
