import 'package:food_yours_customer/FAQ/screen/faq_screen.dart';
import 'package:food_yours_customer/util/navigation_util.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class SupportScreenController extends GetxController {
  gotoContactUsScreen() => print("going to contact us screen");
  gotoFAQScreen() => push(page: FAQScreen());
}
