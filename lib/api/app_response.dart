import 'package:food_yours_customer/resources/enums.dart';

class AppResponse<T> {
  late ResponseGrades responseGrades;
  late int status;
  late String message;
  T? data;

  AppResponse(responseGrades, int? statusCode, String message, [data]) {
    this.responseGrades = responseGrades ?? ResponseGrades.ERROR;
    this.status = statusCode ?? 000;
    this.message = message;
    this.data = data;
  }

  String getResponseMessage(Map<String, dynamic> response, isSuccess) {
    String message;
    if (isSuccess) {
      message = response["message"] ?? "Success";
    } else {
      message = response["message"] ?? "an error occurred";
    }
    return message;
  }
}

localResponse(String? message, [String? responseCode]) {
  return {
    "message": message ?? "An error occurred please try again",
    "code": responseCode ?? 000,
  };
}
