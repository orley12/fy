import 'package:flutter/material.dart';
import 'package:food_yours_customer/cart/controller/cart_order_summary_controlller.dart';
import 'package:food_yours_customer/cart/widget/delivery_details_section.dart';
import 'package:food_yours_customer/cart/widget/food_items_section.dart';
import 'package:food_yours_customer/cart/widget/order_aggregation_section.dart';
import 'package:food_yours_customer/common/widget/secondary_app_bar.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:get/instance_manager.dart';

class CartOrderSummaryScreen extends StatelessWidget {
  final CartOrderSummaryScreenController widgetCtrl =
      Get.put(CartOrderSummaryScreenController());

  @override
  Widget build(BuildContext context) {
    Function sh = sHeight(context);
    Function sw = sWidth(context);

    return Container(
      color: context.theme.backgroundColor,
      child: Scaffold(
        backgroundColor: FYColors.subtleBlack5,
        appBar: PreferredSize(
          preferredSize: Size(sw(20), sh(46.41)),
          child: SecondaryAppBar(
            title: 'Order Summary',
          ),
        ),
        body: ListView(
          children: [
            SizedBox(
              height: sh(Dimens.k24),
            ),
            FoodItemsSection(
              increaseItemQuantity: widgetCtrl.increaseItemQuantity,
              decreaseItemQuantity: widgetCtrl.decreaseItemQuantity,
              onCartItemSelected: widgetCtrl.onCartItemSelected,
            ),
            SizedBox(
              height: sh(Dimens.k23),
            ),
            DeliveryDetailsSection(
              address: widgetCtrl.addressTextController.text,
              gotoChangeAddressScreen: widgetCtrl.gotoChangeAddressScreen,
              recipientNumber: widgetCtrl.deliveryRecipientNumber,
              deliveryDate: widgetCtrl.deliveryDate.value,
              gotoChangeDeliveryTimeScreen:
                  widgetCtrl.gotoChangeDeliveryTimeScreen,
            ),
            SizedBox(
              height: sh(Dimens.k19),
            ),
            OrderAggregationSection(
              subtotal: widgetCtrl.subtotal.value,
              total: widgetCtrl.total.value,
              placeOrder: widgetCtrl.placeOrder,
            ),
          ],
        ),
      ),
    );
  }
}
