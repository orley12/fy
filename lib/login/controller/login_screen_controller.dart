import 'package:food_yours_customer/dashboard/screen/dashboard_screen.dart';
import 'package:food_yours_customer/forgot_password/screen/forgot_password.dart';
import 'package:food_yours_customer/registration/screen/registration_screen.dart';
import 'package:food_yours_customer/util/navigation_util.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class LoginScreenController extends GetxController {
  gotoRegistrationScreen() => push(page: RegistrationScreen());
  gotoForgotPasswordScreen() => push(page: ForgetPasswordScreen());
  gotoDashboardScreen() => push(page: DashboardScreen());
}
