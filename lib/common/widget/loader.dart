import 'package:flutter/material.dart';
import 'package:food_yours_customer/resources/Images.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/utils.dart';
import 'package:loading_overlay/loading_overlay.dart';

class FYLoader extends StatelessWidget {
  final String message;
  final bool isLoading;
  final Widget child;

  FYLoader({
    this.message = "loading ...",
    this.isLoading = false,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final sh = sHeight(context);
    final sw = sWidth(context);

    return Material(
      color: context.theme.backgroundColor,
      child: LoadingOverlay(
        child: child,
        color: context.theme.backgroundColor,
        progressIndicator: Container(
          color: context.theme.backgroundColor,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(Images.loading, width: sw(180), height: sh(90)),
                Text(message, style: context.theme.textTheme.headline3!.copyWith(fontSize: Dimens.k16)),
              ],
            ),
          ),
        ),
        isLoading: isLoading,
      ),
    );
  }
}
