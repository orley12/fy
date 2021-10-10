import 'package:food_yours_customer/common/model/model.dart';

class RegistrationModel extends Model {
  late String firstName;
  late String lastName;
  late String phoneNumber;
  late String email;
  late String password;
  late String confirmPassword;

  RegistrationModel({
    this.firstName = "",
    this.lastName = "",
    this.phoneNumber = "",
    this.email = "",
    this.password = "",
    this.confirmPassword = "",
  });

  @override
  Map<String, dynamic> toJSON() {
    return <String, dynamic>{
      "clientFName": firstName,
      "clientLName": lastName,
      "clientPhone": phoneNumber,
      "clientEmail": email,
      "pass1": password,
      "pass2": confirmPassword,
      "sKey": sKey,
    };
  }
}
