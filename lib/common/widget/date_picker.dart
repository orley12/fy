// import 'package:flutter/cupertino.dart';

// showAppDatePicker() async {
//   print("getting called");
//   return Container(
//     height: 300,
//     child: CupertinoDatePicker(mode: CupertinoDatePickerMode.dateAndTime, onDateTimeChanged: (dateTime) {}),
//   );
// }
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/instance_manager.dart';

Future<DateTime?> showAppDatePicker() async {
  return await showDatePicker(
    context: Get.context!,
    initialDate: DateTime(DateTime.now().year - 18, DateTime.now().month, DateTime.now().day),
    lastDate: DateTime(DateTime.now().year - 18, DateTime.now().month, DateTime.now().day),
    firstDate: DateTime(DateTime.now().year - 100),
  );
}
