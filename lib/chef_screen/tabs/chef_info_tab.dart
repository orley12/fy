import 'package:flutter/material.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class ChefInfoTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Function sh = sHeight(context);
    final Function sw = sWidth(context);

    return Container(
      child: Text(
        "Facilisis leo at pretium elementum et feugiat odio rhoncus suscipit. Nullam risus feugiat purus dolor ultricies id ante purus orci. Malesuada quis malesuada urna dolor blandit facilisi aliquet laoreet. Duis semper sed amet",
        style: context.theme.textTheme.headline4!.copyWith(fontSize: sh(Dimens.k16)),
      ),
    );
  }
}
