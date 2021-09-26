import 'package:food_yours_customer/forgot_password/screen/forgot_password.dart';
import 'package:food_yours_customer/forgot_password/screen/new_password_screen.dart';
import 'package:food_yours_customer/registration/screen/registration_screen.dart';
import 'package:food_yours_customer/util/navigation_util.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ForgetPasswordScreenController extends GetxController {
  gotoRegistrationScreen() => push(page: RegistrationScreen());
  gotoNewPasswordScreen() => push(page: NewPasswordScreen());
}
