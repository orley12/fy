import 'package:food_yours_customer/auth/login/controller/login_screen_controller.dart';
import 'package:food_yours_customer/auth/registration/model/registration_model.dart';

class ProfileUpdateModel extends RegistrationModel {
  String userImage;
  String gender;

  ProfileUpdateModel({
    firstName = "",
    lastName = "",
    phoneNumber = "",
    email = "",
    this.userImage = "",
    this.gender = "",
  }) : super(firstName: firstName, lastName: lastName, phoneNumber: phoneNumber, email: email);

  @override
  Map<String, dynamic> toJSON() {
    return <String, dynamic>{
      "clientFName": firstName,
      "clientLName": lastName,
      "clientPhone": phoneNumber,
      "clientEmail": email,
      "clientPIC": userImage,
      "dateOfBirth": sKey,
      "gender": gender,
      "idToken": token,
      "sKey": sKey,
    };
  }
}
