import 'package:food_yours_customer/common/model/model.dart';

class LoginModel extends Model {
  String email;
  String password;

  LoginModel({
    this.email = "",
    this.password = "",
  });

  @override
  Map<String, dynamic> toJSON() {
    return <String, dynamic>{
      "clientEmail": email,
      "password": password,
      "sKey": sKey,
    };
  }
}
