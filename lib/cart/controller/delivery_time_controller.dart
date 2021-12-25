import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:food_yours_customer/common/view_model/global_objects.dart';
import 'package:food_yours_customer/common/widget/date_picker.dart';
import 'package:food_yours_customer/resources/strings.dart';
import 'package:food_yours_customer/util/date_time_util.dart';
import 'package:get/route_manager.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:get/utils.dart';

class DeliveryTimeScreenController extends GetxController {
  RxDouble subtotal = 0.0.obs;
  RxDouble total = 0.0.obs;

  TextEditingController deliveryTimeTextController = TextEditingController();

  RxString deliverTimeError = "".obs;

  RxInt indexOfSelectedDay = (-1).obs;

  DateTime endTimeForDeliveryAsDateTime = DateTime.now();

  onTimeSelected() async {
    try {
      TimeOfDay startTimeForDeliveryAsTimeOfDay =
          await showAppTimePicker("Delivery duration: Start", TimeOfDay.now());

      DateTime startTimeForDeliveryAsDateTime =
          DateTimeUtil.timeOfDayToDateTime(startTimeForDeliveryAsTimeOfDay);

      String startTimeOfDeliveryAsString = DateTimeUtil.dateTimeToString(
          startTimeForDeliveryAsDateTime, Strings.HOUR_MINUTE_PM);

      TimeOfDay endTimeForDeliveryAsTimeOfDay = await showAppTimePicker(
          "Delivery duration: End",
          startTimeForDeliveryAsTimeOfDay.replacing(
              hour: startTimeForDeliveryAsTimeOfDay.hour + 1,
              minute: startTimeForDeliveryAsTimeOfDay.minute));

      endTimeForDeliveryAsDateTime =
          DateTimeUtil.timeOfDayToDateTime(endTimeForDeliveryAsTimeOfDay);

      String endTimeForDeliveryAsString = DateTimeUtil.dateTimeToString(
          endTimeForDeliveryAsDateTime, Strings.HOUR_MINUTE_PM);

      if (DateTime.now().difference(startTimeForDeliveryAsDateTime).inMinutes >
          5) {
        deliverTimeError.value =
            "Delivery time should be greater than current time";
      } else if (endTimeForDeliveryAsDateTime
              .difference(startTimeForDeliveryAsDateTime)
              .inMinutes <
          55) {
        deliverTimeError.value = "Delivery duration sould be at least an hour";
      } else {
        deliveryTimeTextController.text =
            "$startTimeOfDeliveryAsString $endTimeForDeliveryAsString";
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void onReady() {
    initGetArguments();
    super.onReady();
  }

  void initGetArguments() {
    String todayAsString =
        DateTimeUtil.dateTimeToDayOfWeekString(DateTime.now());

    DeliveryDay todayAsDeliveryDayObject =
        DeliveryDay(dayOfWeek: todayAsString.toLowerCase(), enabled: false);

    (Get.arguments["deliveryDays"] as List).forEach((deliveryDayAsString) {
      DeliveryDay deliveryDayObject =
          DeliveryDay(dayOfWeek: deliveryDayAsString, enabled: false);

      int indexOfOneChefDeliveryDay =
          deliveryDays.indexWhere((e) => e == deliveryDayObject);

      int indexOfToday = deliveryDays
          .indexWhere((element) => element == todayAsDeliveryDayObject);

      if (deliveryDays.contains(deliveryDayObject) &&
          (indexOfOneChefDeliveryDay >= indexOfToday)) {
        deliveryDays.value[indexOfOneChefDeliveryDay]..enabled = true;
      }
    });
  }

  onSelectDeliveryDay(int index) {
    indexOfSelectedDay.value = index;
  }

  void validateInputs() => Get.back(result: {
        "deliveryDay": deliveryDays.value[indexOfSelectedDay.value],
        "deliverTime": endTimeForDeliveryAsDateTime,
      });
}

class DeliveryDay extends Equatable {
  String dayOfWeek;
  bool enabled;
  DeliveryDay({required this.dayOfWeek, this.enabled = false});

  @override
  List<Object?> get props => [dayOfWeek];
}
