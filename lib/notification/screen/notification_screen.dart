import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_icons/flutter_icons.dart';
import 'package:food_yours_customer/common/service/hive_service.dart';
import 'package:food_yours_customer/common/widget/fy_switch.dart';
import 'package:food_yours_customer/common/widget/loader.dart';
import 'package:food_yours_customer/common/widget/primary_app_bar.dart';
import 'package:food_yours_customer/notification/controller/notification_screen_controller.dart';
import 'package:food_yours_customer/notification/widget/notification_card.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:get/instance_manager.dart';
import 'package:hive_flutter/hive_flutter.dart';

class NotificationScreen extends StatelessWidget {
  final NotificationScreenController widgetCtrl =
      Get.put(NotificationScreenController());

  @override
  Widget build(BuildContext context) {
    Function sh = sHeight(context);
    Function sw = sWidth(context);

    return Obx(
      () => FYLoader(
        isLoading: widgetCtrl.isLoading.value,
        message: widgetCtrl.loadingMessage.value,
        child: Container(
          color: context.theme.backgroundColor,
          child: SafeArea(
            child: Scaffold(
              backgroundColor: FYColors.subtleBlack5,
              appBar: PreferredSize(
                  preferredSize: Size(20, sh(46.41)),
                  child: PrimaryAppBar(title: "Notification")),
              body: ListView(
                padding: EdgeInsets.symmetric(horizontal: sw(23)),
                children: [
                  SizedBox(height: sh(16)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Push notification",
                          style: context.theme.textTheme.headline4!
                              .copyWith(fontSize: sh(Dimens.k12))),
                      SizedBox(width: sw(12)),
                      Transform.scale(
                          scale: 0.65,
                          child: Obx(() => FYSwitch(
                                onChanged: widgetCtrl.toggleNotification,
                                value: widgetCtrl.enableNotification.value,
                                activeWidget: Icon(Icons.check,
                                    size: sh(24),
                                    color: context.theme.backgroundColor),
                                inactiveWidget: Container(width: sw(24)),
                                inactiveColor: FYColors.lighterBlack2,
                              ))),
                    ],
                  ),
                  SizedBox(height: sh(13)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Entypo.dot_single,
                          color: context.theme.textTheme.headline3!.color),
                      Text(
                        "Click on a notification to mark it as read",
                        style: context.theme.textTheme.headline3!.copyWith(
                            fontSize: sh(12), fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  SizedBox(height: sh(10)),
                  Obx(
                    () => widgetCtrl.loadingError.value == ""
                        ? ValueListenableBuilder<Box>(
                            valueListenable:
                                HiveService.getNotificationsBox().listenable(),
                            builder: (context, box, _) {
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                reverse: true,
                                itemBuilder:
                                    (BuildContext context, int index) =>
                                        NotificationCard(box.getAt(index)),
                                itemCount: box.values.length,
                              );
                            })
                        : Container(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
