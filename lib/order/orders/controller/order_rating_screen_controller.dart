import 'package:food_yours_customer/dashboard/screen/dashboard_screen.dart';
import 'package:food_yours_customer/util/navigation_util.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class OrderRatingScreenController extends GetxController {
  gotoDashBoardScreen() => push(page: DashboardScreen());
}
