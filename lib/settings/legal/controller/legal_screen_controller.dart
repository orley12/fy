import 'package:food_yours_customer/settings/privacy/screen/privacy_screen.dart';
import 'package:food_yours_customer/settings/terms_of_use/screen/terms_of_use_screen.dart';
import 'package:get/route_manager.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class LegalScreenController extends GetxController {
  gotoPrivacyScreen() => Get.to(() => PrivacyScreen());
  gotoTermsOfUseScreen() => Get.to(() => TermsOfUseScreen());
}
