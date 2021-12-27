// ignore: import_of_legacy_library_into_null_safe
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:food_yours_customer/cart/controller/delivery_time_controller.dart';
import 'package:food_yours_customer/common/view_model/global_objects.dart';
import 'package:food_yours_customer/common/widget/app_button.dart';
import 'package:food_yours_customer/common/widget/input_field_wrapper.dart';
import 'package:food_yours_customer/common/widget/loader.dart';
import 'package:food_yours_customer/common/widget/secondary_app_bar.dart';
import 'package:food_yours_customer/common/widget/secondary_text_input_field.dart';
import 'package:food_yours_customer/common/widget/text_button.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/resources/icons.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:get/instance_manager.dart';

class DeliveryTimeScreen extends StatelessWidget {
  final DeliveryTimeScreenController widgetCtrl =
      Get.put(DeliveryTimeScreenController());

  @override
  Widget build(BuildContext context) {
    Function sh = sHeight(context);
    Function sw = sWidth(context);

    return FYLoader(
      child: Container(
          color: FYColors.lighterBlack2,
          child: Scaffold(
            backgroundColor: context.theme.backgroundColor,
            appBar: PreferredSize(
                preferredSize: Size(sw(20), sh(46.41)),
                child: SecondaryAppBar(title: 'Change Delivery Date/Time')),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: sw(24)),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: sh(25)),
                    AutoSizeText("Day of Delivery",
                        style: context.theme.textTheme.caption!.copyWith(
                            fontSize: sh(Dimens.k16),
                            fontWeight: FontWeight.w700,
                            color: FYColors.darkerBlack2)),
                    SizedBox(height: sh(12)),
                    Obx(
                      () => Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: deliveryDays.value.length,
                          itemBuilder: (BuildContext buildContext, int index) =>
                              Obx(
                            () => ListTile(
                              minVerticalPadding: 0,
                              contentPadding: EdgeInsets.zero,
                              dense: true,
                              onTap: deliveryDays.value[index].enabled
                                  ? () => widgetCtrl.onSelectDeliveryDay(index)
                                  : null,
                              leading: Checkbox(
                                  value: index ==
                                      widgetCtrl.indexOfSelectedDay.value,
                                  onChanged: deliveryDays.value[index].enabled
                                      ? (_) =>
                                          widgetCtrl.onSelectDeliveryDay(index)
                                      : null,
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap),
                              title: Text(
                                "${deliveryDays.value[index].dayOfWeek}",
                                style: context.theme.textTheme.caption!
                                    .copyWith(
                                        fontSize: sh(Dimens.k16),
                                        fontWeight: FontWeight.w400,
                                        color: deliveryDays.value[index].enabled
                                            ? FYColors.darkerBlack2
                                            : FYColors.subtleBlack3),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: sh(11)),
                    AutoSizeText("Time of Delivery",
                        style: context.theme.textTheme.caption!.copyWith(
                            fontSize: sh(Dimens.k16),
                            fontWeight: FontWeight.w700,
                            color: FYColors.darkerBlack2)),
                    SizedBox(height: sh(16)),
                    Obx(
                      () => InputFieldWrapper(
                        labelText: "Select a timeframe",
                        child: FYButton(
                          onTap: () => widgetCtrl.onTimeSelected(),
                          child: SecondaryTextField(
                            enabled: false,
                            controller: widgetCtrl.deliveryTimeTextController,
                            hintText: "12PM - 1PM",
                            errorMessage: widgetCtrl.deliverTimeError.value,
                            suffixIcon: Icon(FYIcons.chevron_down),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: sh(32)),
                    Center(
                      child: FYTextButton(
                        text: "Save and Continue",
                        onPressed: widgetCtrl.validateInputs,
                      ),
                    ),
                    SizedBox(height: sh(32)),
                  ]),
            ),
          )),
    );
  }
}
