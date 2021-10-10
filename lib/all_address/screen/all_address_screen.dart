import 'package:flutter/material.dart';
import 'package:food_yours_customer/all_address/widget/address_item.dart';
import 'package:food_yours_customer/common/widget/secondary_app_bar.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class AllAddressesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Function sh = sHeight(context);
    final Function sw = sWidth(context);

    return Container(
      color: context.theme.backgroundColor,
      child: Scaffold(
        backgroundColor: FYColors.subtleBlack5,
        appBar: PreferredSize(preferredSize: Size(sw(20), sh(46.41)), child: SecondaryAppBar(title: "My Addresses")),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: sh(24)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: sw(24)),
              child: Text("You can have up to 4 saved addresses",
                  style: context.theme.textTheme.headline4!.copyWith(fontSize: sh(Dimens.k12))),
            ),
            SizedBox(height: sh(8)),
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: sw(24)),
                itemBuilder: (BuildContext context, int index) => AddressItem(),
                separatorBuilder: (BuildContext context, int index) => SizedBox(height: sh(16)),
                itemCount: 3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
