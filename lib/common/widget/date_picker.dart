// import 'package:flutter/cupertino.dart';

// showAppDatePicker() async {
//   print("getting called");
//   return Container(
//     height: 300,
//     child: CupertinoDatePicker(mode: CupertinoDatePickerMode.dateAndTime, onDateTimeChanged: (dateTime) {}),
//   );
// }
import 'package:flutter/material.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:get/instance_manager.dart';

Future<DateTime?> showAppDatePicker() async {
  return await showDatePicker(
    context: Get.context!,
    initialDate: DateTime(
        DateTime.now().year - 18, DateTime.now().month, DateTime.now().day),
    lastDate: DateTime(
        DateTime.now().year - 18, DateTime.now().month, DateTime.now().day),
    firstDate: DateTime(DateTime.now().year - 100),
  );
}

showAppTimePicker([String datePickerTitle = "", TimeOfDay? initialTime]) async {
  Function sh = sHeight(Get.context!);
  Function sw = sHeight(Get.context!);

  return await showTimePicker(
      context: Get.context!,
      initialTime: initialTime ?? TimeOfDay.now(),
      builder: (BuildContext context, Widget? child) {
        return Column(children: [
          Container(
            width: sw(300),
            height: sh(40),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8), color: Colors.white),
            child: Center(
              child: Text(datePickerTitle,
                  style: context.theme.textTheme.caption!.copyWith(
                      fontSize: sh(Dimens.k18),
                      fontWeight: FontWeight.w700,
                      color: FYColors.darkerBlack2)),
            ),
          ),
          child!,
        ]);
      });
}
