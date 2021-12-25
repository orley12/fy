import 'package:food_yours_customer/auth/forgot_password/screen/fogot_password_confirmation_screen.dart';
import 'package:food_yours_customer/auth/registration/screen/registration_screen.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';

class NewPasswordScreenController extends GetxController {
  gotoRegistrationScreen() => Get.to(() => RegistrationScreen());
  gotoPasswordResetConfirmationScreen() =>
      Get.to(() => ForgotPasswordConfirmationScreen());
}
