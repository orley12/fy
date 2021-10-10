import 'package:food_yours_customer/resources/strings.dart';

abstract class Model {
  String sKey = Strings.apiKey;
  Map<String, dynamic> toJSON();
}
