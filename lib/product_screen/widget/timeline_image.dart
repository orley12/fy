import 'package:flutter/material.dart';
import 'package:food_yours_customer/resources/Images.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class TimeLineImage extends StatelessWidget {
  const TimeLineImage({
    Key? key,
    required this.timelineImage,
  }) : super(key: key);

  final String timelineImage;

  @override
  Widget build(BuildContext context) {
    return FlexibleSpaceBar(
      background: Container(
        color: context.theme.backgroundColor,
        child: ClipRRect(
          child: FadeInImage.assetNetwork(
            placeholder: Images.search_result,
            image: timelineImage,
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(Dimens.k8_83),
            bottomRight: Radius.circular(Dimens.k8_83),
          ),
        ),
      ),
    );
  }
}
