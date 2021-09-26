import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_yours_customer/common/widget/fy_outline_button.dart';
import 'package:food_yours_customer/resources/Images.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class AdSpace extends StatelessWidget {
  final Function? adAction;

  AdSpace(this.adAction);

  @override
  Widget build(BuildContext context) {
    Function sh = sHeight(context);
    Function sw = sWidth(context);

    return Stack(
      children: [
        Container(
          child: SvgPicture.asset(Images.ad_banner, height: sh(Dimens.k89), fit: BoxFit.fill),
        ),
        Container(
          padding: EdgeInsets.only(left: sw(Dimens.k15), right: sw(Dimens.k19)),
          height: sh(Dimens.k89),
          child: buildAdContent(context, sw, sh),
        ),
      ],
    );
  }

  Row buildAdContent(BuildContext context, Function sw, Function sh) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AutoSizeText("Free delivery on orders \nabove N7K",
                minFontSize: Dimens.k8,
                maxLines: 2,
                style: context.theme.textTheme.button!.copyWith(fontSize: Dimens.k16, fontWeight: FontWeight.w700)),
          ],
        ),
        SizedBox(width: sw(17)),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FYOutlineButton(
              text: "Start Ordering",
              onPressed: () => adAction == null ? null : adAction!(),
            ),
            // SizedBox(height: sh(Dimens.k8)),
          ],
        ),
      ],
    );
  }
}
