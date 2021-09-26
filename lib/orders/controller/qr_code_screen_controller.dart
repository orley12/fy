import 'package:food_yours_customer/orders/screen/order_rating_screen.dart';
import 'package:food_yours_customer/util/navigation_util.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class QRCodeScreenController extends GetxController {
  gotoChefRatingScreen() => push(page: OrderRatingScreen());
}
