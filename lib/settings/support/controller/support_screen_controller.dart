import 'package:food_yours_customer/settings/FAQ/screen/faq_screen.dart';
import 'package:get/route_manager.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class SupportScreenController extends GetxController {
  gotoContactUsScreen() => print("going to contact us screen");
  gotoFAQScreen() => Get.to(() => FAQScreen());
}
