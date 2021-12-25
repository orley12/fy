import 'package:flutter/material.dart';
import 'package:food_yours_customer/resources/Images.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class LoadingGif extends StatelessWidget {
  final String message;

  const LoadingGif({this.message = "loading ..."});

  @override
  Widget build(BuildContext context) {
    final sh = sHeight(context);
    final sw = sWidth(context);

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(Images.loading, width: sw(180), height: sh(90)),
          Text(message,
              style: context.theme.textTheme.headline3!
                  .copyWith(fontSize: Dimens.k16)),
        ],
      ),
    );
  }
}
