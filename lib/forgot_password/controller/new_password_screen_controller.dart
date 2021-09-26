import 'package:food_yours_customer/forgot_password/screen/fogot_password_confirmation_screen.dart';
import 'package:food_yours_customer/registration/screen/registration_screen.dart';
import 'package:food_yours_customer/util/navigation_util.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class NewPasswordScreenController extends GetxController {
  gotoRegistrationScreen() => push(page: RegistrationScreen());
  gotoPasswordResetConfirmationScreen() => push(page: ForgotPasswordConfirmationScreen());
}
