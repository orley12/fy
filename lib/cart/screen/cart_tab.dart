import 'package:flutter/material.dart';
import 'package:food_yours_customer/cart/controller/cart_tab_controller.dart';
import 'package:food_yours_customer/cart/widget/cart_card.dart';
import 'package:food_yours_customer/common/widget/secondary_app_bar.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/resources/strings.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:get/instance_manager.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CartTab extends StatelessWidget {
  final CartTabController widgetCtrl = Get.put(CartTabController());

  @override
  Widget build(BuildContext context) {
    Function sh = sHeight(context);
    Function sw = sWidth(context);

    return Container(
      color: context.theme.backgroundColor,
      child: Scaffold(
        backgroundColor: FYColors.subtleBlack5,
        appBar: PreferredSize(
            preferredSize: Size(20, sh(46.41)),
            child: SecondaryAppBar(title: "Food Cart")),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: sw(24)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: sh(16)),
              Text("* Click on a saved order to check details or checkout",
                  style: context.theme.textTheme.headline3!.copyWith(
                    fontSize: sh(12),
                    fontWeight: FontWeight.w600,
                    color: FYColors.lighterBlack2,
                  )),
              SizedBox(height: sh(24)),
              ValueListenableBuilder<Box>(
                  valueListenable: Hive.box(Strings.CART_BOX).listenable(),
                  builder: (context, box, _) {
                    return Expanded(
                      child: ListView.separated(
                        padding: EdgeInsets.zero,
                        itemBuilder: (BuildContext context, int index) =>
                            CartCard(box.getAt(index)),
                        separatorBuilder: (BuildContext context, int index) =>
                            SizedBox(height: sh(Dimens.k24)),
                        itemCount: box.values.length,
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
