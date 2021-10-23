import 'package:food_yours_customer/common/model/model.dart';

class UserModel extends Model {
  String token;

  UserModel({
    this.token = "",
  });

  @override
  Map<String, dynamic> toJSON() {
    return <String, dynamic>{
      "idToken": token,
      "sKey": sKey,
    };
  }
}
