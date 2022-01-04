import 'package:flutter/material.dart';
import 'package:food_yours_customer/cart/controller/delivery_time_controller.dart';
import 'package:food_yours_customer/cart/interface/interface_cart_order.dart';
import 'package:food_yours_customer/cart/model/cart_model.dart';
import 'package:food_yours_customer/cart/screen/delivery_time_screen.dart';
import 'package:food_yours_customer/cart/screen/payment_method_screen.dart';
import 'package:food_yours_customer/common/view_model/global_objects.dart';
import 'package:food_yours_customer/common/widget/notification_widgets.dart';
import 'package:food_yours_customer/resources/strings.dart';
import 'package:food_yours_customer/user/all_address/screen/all_address_screen.dart';
import 'package:food_yours_customer/util/date_time_util.dart';
import 'package:food_yours_customer/util/navigation_util.dart';
import 'package:get/route_manager.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:get/utils.dart';
import 'package:hive/hive.dart';

class CartOrderSummaryScreenController extends GetxController
    implements ICartOrder {
  RxDouble subtotal = 0.0.obs;
  RxDouble total = 0.0.obs;

  RxString addressError = "".obs;

  CartModel selectedCartItem = CartModel();

  TextEditingController addressTextController = TextEditingController();

  String deliveryRecipientNumber = user.value.phone;

  RxString deliveryDate = "".obs;

  @override
  placeOrder() => Get.to(() => PaymentMethodScreen(),
      arguments: {"total": total.value, "deliveryDate": deliveryDate.value});

  increaseItemQuantity(String cartItemId) {
    CartModel cartItem = Hive.box(Strings.CART_BOX).get(cartItemId);
    cartItem.count += 1;
    Hive.box(Strings.CART_BOX).put(cartItemId, cartItem);
    int cartItemsCount =
        Hive.box(Strings.RANDOM_INFORMATION_BOX).get(Strings.CART_ITEMS_COUNT);
    Hive.box(Strings.RANDOM_INFORMATION_BOX)
        .put(Strings.CART_ITEMS_COUNT, cartItemsCount += 1);
  }

  decreaseItemQuantity(String cartItemId) {
    CartModel cartItem = Hive.box(Strings.CART_BOX).get(cartItemId);
    if (cartItem.count < 1) {
      Hive.box(Strings.CART_BOX).delete(cartItemId);
      Hive.box(Strings.CART_BOX).compact();
      return;
    }
    Hive.box(Strings.CART_BOX).put(cartItemId, cartItem.count -= 1);
    int cartItemsCount =
        Hive.box(Strings.RANDOM_INFORMATION_BOX).get(Strings.CART_ITEMS_COUNT);
    Hive.box(Strings.RANDOM_INFORMATION_BOX)
        .put(Strings.CART_ITEMS_COUNT, cartItemsCount -= 1);
  }

  getSubTotal() {
    subtotal.value = Hive.box(Strings.CART_BOX).values.fold(
        0.0,
        (double previousValue, element) =>
            previousValue += ((element as CartModel).total * element.count));
  }

  getTotal() {
    total.value = subtotal.value + 1000;
  }

  @override
  void onReady() {
    initGetArguments();
    getSubTotal();
    getTotal();
    super.onReady();
  }

  gotoChangeAddressScreen() => Get.to(() => AllAddressesScreen());

  validateAddressChange() {
    pop();
  }

  onCartItemSelected(CartModel value) {
    selectedCartItem.chefDeliveryDays = value.chefDeliveryDays;
  }

  gotoChangeDeliveryTimeScreen() {
    if (selectedCartItem.chefDeliveryDays.isEmpty)
      return showFYSnackBar(message: "Please select an order to edit");
    Get.to(() => DeliveryTimeScreen(),
            arguments: {"deliveryDays": selectedCartItem.chefDeliveryDays})
        ?.then((value) => setNewDeliveryTimeAndDay(value));
  }

  void initGetArguments() {
    addressTextController.text = user.value.address;
    deliveryDate.value =
        DateTimeUtil.dateTimeToString(DateTime.now(), Strings.DAY_MONTH_YEAR);
  }

  setNewDeliveryTimeAndDay(Map? value) {
    if (value != null) {
      DeliveryDay deliveryDay = value["deliveryDay"];
      DateTime deliverTime = value["deliverTime"];

      DateTime nowAsDateTime = DateTime.now();
      String nowAsString =
          DateTimeUtil.dateTimeToDayOfWeekString(nowAsDateTime).toLowerCase();

      int indexOfSelectedDeliveryDate =
          selectedCartItem.chefDeliveryDays.indexWhere((e) => e == deliveryDay);
      int indexOfDeliveryDate = selectedCartItem.chefDeliveryDays
          .indexWhere((e) => e == DeliveryDay(dayOfWeek: nowAsString));

      while (nowAsString != deliveryDay.dayOfWeek) {
        if (indexOfSelectedDeliveryDate > indexOfDeliveryDate) {
          nowAsDateTime = nowAsDateTime.add(new Duration(days: 1));
        } else {
          nowAsDateTime = nowAsDateTime.subtract(new Duration(days: 1));
        }
        nowAsString =
            DateTimeUtil.dateTimeToDayOfWeekString(nowAsDateTime).toLowerCase();
      }

      deliveryDate.value =
          "${DateTimeUtil.dateTimeToString(nowAsDateTime, Strings.DAY_MONTH_YEAR)} ${DateTimeUtil.dateTimeToString(deliverTime, Strings.HOUR_MINUTE_PM)}";

      selectedCartItem.specifiedDeliveryAndTime = deliveryDate.value;
    }
  }
}
