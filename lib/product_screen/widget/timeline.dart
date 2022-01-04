import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_yours_customer/common/widget/button/fy_flat_button.dart';
import 'package:food_yours_customer/product_screen/widget/cart_icon.dart';
import 'package:food_yours_customer/product_screen/widget/timeline_image.dart';
import 'package:food_yours_customer/resources/Images.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/util/navigation_util.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';

class Timeline extends StatelessWidget {
  final String timelineImage;
  final Function() onCartPressed;
  final AnimationController animationCtrl;
  final Animation<double> animation;
  final double height;

  const Timeline({
    Key? key,
    required this.timelineImage,
    required this.onCartPressed,
    required this.animationCtrl,
    required this.animation,
    this.height = Dimens.k295,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Function sh = sHeight(context);
    final Function sw = sWidth(context);

    return SliverAppBar(
      automaticallyImplyLeading: false,
      leadingWidth: sw(Dimens.k80),
      leading: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(width: sw(Dimens.k24)),
          Expanded(
            child: FYFlatButton(
              child: SvgPicture.asset(
                Images.back,
                height: sh(Dimens.k40),
                width: sw(Dimens.k40),
              ),
              onPressed: pop,
              backgroundColor: Colors.transparent,
            ),
          )
        ],
      ),
      actions: [
        cartIcon(
          onCartPressed: onCartPressed,
          animationCtrl: animationCtrl,
          animation: animation,
        ),
        SizedBox(
          width: sw(Dimens.k24),
        )
      ],
      expandedHeight: sh(height),
      pinned: true,
      flexibleSpace: TimeLineImage(
        timelineImage: timelineImage,
      ),
    );
  }
}
