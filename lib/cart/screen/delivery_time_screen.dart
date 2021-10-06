import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:food_yours_customer/common/fy_drop_down.dart';
import 'package:food_yours_customer/common/widget/input_field_wrapper.dart';
import 'package:food_yours_customer/common/widget/secondary_app_bar.dart';
import 'package:food_yours_customer/common/widget/secondary_text_input_field.dart';
import 'package:food_yours_customer/common/widget/text_button.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class DeliveryTimeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Function sh = sHeight(context);
    Function sw = sWidth(context);

    return Container(
        color: FYColors.lighterBlack2,
        child: Scaffold(
          backgroundColor: context.theme.backgroundColor,
          appBar:
              PreferredSize(preferredSize: Size(sw(20), sh(46.41)), child: SecondaryAppBar(title: 'Change Delivery Date/Time')),
          body: ListView(padding: EdgeInsets.symmetric(horizontal: sw(24)), children: [
            SizedBox(height: sh(25)),
            AutoSizeText("Day of Delivery",
                style: context.theme.textTheme.caption!
                    .copyWith(fontSize: sh(Dimens.k16), fontWeight: FontWeight.w700, color: FYColors.darkerBlack2)),
            SizedBox(height: sh(12)),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 7,
                itemBuilder: (BuildContext buildContext, int index) => ListTile(
                  minVerticalPadding: 0,
                  contentPadding: EdgeInsets.zero,
                  dense: true,
                  leading: Checkbox(value: false, onChanged: null, materialTapTargetSize: MaterialTapTargetSize.shrinkWrap),
                  title: Text(
                    "Tuesday(24/08/2021)",
                    style: context.theme.textTheme.caption!
                        .copyWith(fontSize: sh(Dimens.k16), fontWeight: FontWeight.w400, color: FYColors.darkerBlack2),
                  ),
                ),
              ),
            ),
            SizedBox(height: sh(11)),
            AutoSizeText("Time of Delivery",
                style: context.theme.textTheme.caption!
                    .copyWith(fontSize: sh(Dimens.k16), fontWeight: FontWeight.w700, color: FYColors.darkerBlack2)),
            SizedBox(height: sh(16)),
            InputFieldWrapper(
                labelText: "Select a timeframe",
                child: FYDropDownButton(
                    isExpanded: true,
                    hintText: "12PM - 1PM",
                    options: [],
                    onChanged: (FYDropDownItem value) {},
                    borderColor: FYColors.lighterBlack2,
                    errorMessage: "")),
            SizedBox(height: sh(32)),
            FYTextButton(
              text: "Save and Continue",
              onPressed: () {},
            ),
          ]),
        ));
  }
}
// class PaymentMethodScreenController extends GetxController implements ICartOrder {
//   RxList<Widget> paymentMethods = <Widget>[].obs;

//   @override
//   placeOrder() => push(page: DeliveryTimeScreen());
// }
