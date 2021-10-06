import 'package:flutter/material.dart';
import 'package:food_yours_customer/common/widget/secondary_app_bar.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class FAQScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Function sh = sHeight(context);
    final Function sw = sWidth(context);

    return Container(
      color: context.theme.backgroundColor,
      child: Scaffold(
        backgroundColor: FYColors.subtleBlack5,
        appBar: PreferredSize(preferredSize: Size(sw(20), sh(46.41)), child: SecondaryAppBar(title: "Support")),
        body: ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: sw(24), vertical: sh(24)),
          itemBuilder: (BuildContext context, int index) => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ExpansionTile(
                title: Text(
                  "Question 1",
                  style: context.theme.textTheme.caption!
                      .copyWith(fontSize: sh(Dimens.k16), fontWeight: FontWeight.w400, color: FYColors.darkerBlack2),
                ),
                children: <Widget>[
                  ListTile(
                    title: Text(
                      "Porttitor ullamcorper aliquam ac id. Vitae sagittis id nulla eu, ut sed vulputate risus et. Sapien dui ullamcorper aenean eu eleifend donec consequat.Amet, et integer vitae, fermentum praesent sed.",
                      style: context.theme.textTheme.caption!
                          .copyWith(fontSize: sh(Dimens.k12), fontWeight: FontWeight.w400, color: FYColors.lighterBlack2),
                    ),
                  )
                ],
              ),
              Divider(thickness: 0.5, height: 0)
            ],
          ),
          itemCount: 10,
        ),
      ),
    );
  }
}
