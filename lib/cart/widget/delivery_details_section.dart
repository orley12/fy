import 'package:flutter/material.dart';
import 'package:food_yours_customer/common/widget/button/fy_flat_button.dart';
import 'package:food_yours_customer/common/widget/text/mulish_400_text.dart';
import 'package:food_yours_customer/common/widget/text/mulish_600_text.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';

class DeliveryDetailsSection extends StatelessWidget {
  final String address;
  final Function() gotoChangeAddressScreen;
  final String recipientNumber;
  final String deliveryDate;
  final Function() gotoChangeDeliveryTimeScreen;

  const DeliveryDetailsSection({
    Key? key,
    required this.address,
    required this.gotoChangeAddressScreen,
    required this.recipientNumber,
    required this.deliveryDate,
    required this.gotoChangeDeliveryTimeScreen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Function sh = sHeight(context);
    Function sw = sWidth(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: sw(Dimens.k24),
          ),
          child: Mulish600Text(
            text: "Delivery Details",
            fontSize: Dimens.k16,
            color: FYColors.darkerBlack2,
          ),
        ),
        SizedBox(
          height: sh(Dimens.k8),
        ),
        Container(
          color: Colors.white,
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: sw(Dimens.k24),
            vertical: sh(Dimens.k12),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Mulish400Text(
                    text: "Address",
                    fontSize: sh(Dimens.k12),
                  ),
                  SizedBox(
                    height: sh(Dimens.k45),
                  ),
                  Mulish400Text(
                    text: "Contact:",
                    fontSize: sh(Dimens.k12),
                  ),
                  SizedBox(
                    height: sh(Dimens.k4),
                  ),
                  Mulish400Text(
                    text: "Date & Time:",
                    fontSize: sh(Dimens.k12),
                  ),
                ],
              ),
              SizedBox(
                width: sw(Dimens.k48),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Mulish600Text(
                    text: address,
                    fontSize: sh(Dimens.k12),
                    color: FYColors.darkerBlack2,
                  ),
                  SizedBox(height: sh(15)),
                  FYFlatButton(
                    onPressed: () => gotoChangeAddressScreen(),
                    size: Size(Dimens.k83, Dimens.k20),
                    child: Mulish600Text(
                      text: "Tap to Change",
                      color: FYColors.mainBlue,
                      fontSize: sh(Dimens.k12),
                    ),
                  ),
                  SizedBox(height: sh(15)),
                  Mulish600Text(
                    text: recipientNumber,
                    fontSize: sh(Dimens.k12),
                    color: FYColors.darkerBlack2,
                  ),
                  SizedBox(height: sh(Dimens.k4)),
                  Mulish600Text(
                    text: deliveryDate,
                    fontSize: sh(Dimens.k12),
                    color: FYColors.darkerBlack2,
                  ),
                  SizedBox(
                    height: sh(Dimens.k10),
                  ),
                  FYFlatButton(
                    onPressed: gotoChangeDeliveryTimeScreen,
                    size: Size(Dimens.k61, Dimens.k20),
                    child: Mulish600Text(
                      text: "Tap to Edit",
                      color: FYColors.mainBlue,
                      fontSize: sh(Dimens.k12),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
