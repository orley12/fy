import 'package:food_yours_customer/resources/enums.dart';

class AppResponse<T> {
  final ResponseGrades responseGrades;
  final int statusCode;
  final String message;
  T? data;

  AppResponse([this.responseGrades = ResponseGrades.ERROR, this.statusCode = 000, this.message = "", this.data]);
}

localResponse(String? message, [String? responseCode]) {
  return {
    "message": message ?? "An error occurred please try again",
    "code": responseCode ?? 000,
  };
}
