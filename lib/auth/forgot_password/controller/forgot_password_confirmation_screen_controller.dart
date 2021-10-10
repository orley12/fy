import 'package:food_yours_customer/auth/registration/screen/registration_screen.dart';
import 'package:food_yours_customer/util/navigation_util.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ForgetPasswordConfirmationScreenController extends GetxController {
  gotoRegistrationScreen() => push(page: RegistrationScreen());
}
