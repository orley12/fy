import 'package:food_yours_customer/cart/controller/delivery_time_controller.dart';
import 'package:food_yours_customer/home/view_model/food_category_view_model.dart';
import 'package:food_yours_customer/user/view_model/user_view_model.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

Rx<UserViewModel> user = UserViewModel().obs;
RxList<FoodCategoryViewModel> foodCategories =
    FoodCategoryViewModel.getList(null);
RxList deliveryDays = [
  DeliveryDay(dayOfWeek: "monday", enabled: false),
  DeliveryDay(dayOfWeek: "tuesday", enabled: false),
  DeliveryDay(dayOfWeek: "wednesday", enabled: false),
  DeliveryDay(dayOfWeek: "thursday", enabled: false),
  DeliveryDay(dayOfWeek: "friday", enabled: false),
  DeliveryDay(dayOfWeek: "saturday", enabled: false),
  DeliveryDay(dayOfWeek: "sunday", enabled: false),
].obs;
