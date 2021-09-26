import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class NotificationScreenController extends GetxController {
  RxBool enableNotification = false.obs;

  toggleNotification(bool value) => enableNotification.value = value;
}
