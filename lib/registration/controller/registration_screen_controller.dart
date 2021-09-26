import 'package:food_yours_customer/login/screen/login_screen.dart';
import 'package:food_yours_customer/util/navigation_util.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class RegistrationScreenController extends GetxController {
  gotoLoginScreen() => push(page: LoginScreen());
}
