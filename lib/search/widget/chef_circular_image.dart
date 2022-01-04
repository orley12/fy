import 'package:flutter/material.dart';
import 'package:food_yours_customer/resources/Images.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';

class ChefCircularImage extends StatelessWidget {
  final String chefImage;
  final double backgroundDiameter;
  final double foregroundDiameter;

  const ChefCircularImage({
    Key? key,
    required this.chefImage,
    this.backgroundDiameter = Dimens.k45,
    this.foregroundDiameter = Dimens.k40,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Function sh = sHeight(context);
    Function sw = sWidth(context);

    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Container(
          height: sh(Dimens.k45),
          width: sw(Dimens.k45),
          decoration:
              BoxDecoration(color: Colors.white, shape: BoxShape.circle),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(Dimens.k50),
          child: FadeInImage.assetNetwork(
            placeholder: Images.chef,
            image: chefImage,
            fit: BoxFit.cover,
            height: sh(Dimens.k40),
            width: sw(Dimens.k40),
          ),
        )
      ],
    );
  }
}
