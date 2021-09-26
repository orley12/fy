import 'package:food_yours_customer/home/controller/home_tab_controller.dart';
import 'package:food_yours_customer/search_screen/screen/filter_screen.dart';
import 'package:food_yours_customer/util/navigation_util.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';

class HomeTabBackPanelController extends GetxController {
  late HomeTabController homeTabCrtl = Get.find<HomeTabController>();

  RxList<String> resentSearches = [
    "Jollof Rice",
    "Doughnut",
    "Egusi",
    "Ofe Nsala",
    "Gbegiri and Ewedu",
    "Beske",
  ].obs;

  RxList<String> suggestions = [
    "Jollof Rice",
    "Fried Rice",
    "Coconut Rice",
    "Rice and Stew",
  ].obs;

  gotoFilterScreen() => push(page: FilterScreen());
}
