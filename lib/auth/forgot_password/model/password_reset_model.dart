import 'package:food_yours_customer/common/model/model.dart';

class PasswordResetModel extends Model {
  String email;

  PasswordResetModel({
    this.email = "",
  });

  @override
  Map<String, dynamic> toJSON() {
    return <String, dynamic>{
      "clientEmail": email,
      "sKey": sKey,
    };
  }
}
