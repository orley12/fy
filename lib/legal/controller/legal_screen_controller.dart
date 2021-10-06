import 'package:food_yours_customer/privacy/screen/privacy_screen.dart';
import 'package:food_yours_customer/terms_of_use/screen/terms_of_use_screen.dart';
import 'package:food_yours_customer/util/navigation_util.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class LegalScreenController extends GetxController {
  gotoPrivacyScreen() => push(page: PrivacyScreen());
  gotoTermsOfUseScreen() => push(page: TermsOfUseScreen());
}
