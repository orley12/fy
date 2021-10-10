import 'package:food_yours_customer/order/orders/screen/qr_code_screen.dart';
import 'package:food_yours_customer/util/navigation_util.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class OrderTrackingScreenController extends GetxController {
  void gotoQrCodeScreen() => push(page: QRCodeScreen());
}
