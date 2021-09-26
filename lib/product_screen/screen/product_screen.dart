import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_yours_customer/common/widget/app_button.dart';
import 'package:food_yours_customer/common/widget/local_theme.dart';
import 'package:food_yours_customer/common/widget/secondary_text_input_field.dart';
import 'package:food_yours_customer/common/widget/text_button.dart';
import 'package:food_yours_customer/home/widget/fy_chip.dart';
import 'package:food_yours_customer/product_screen/widget/article.dart';
import 'package:food_yours_customer/product_screen/widget/food_header.dart';
import 'package:food_yours_customer/resources/Images.dart';
import 'package:food_yours_customer/resources/colors.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/resources/icons.dart';
import 'package:food_yours_customer/resources/style.dart';
import 'package:food_yours_customer/util/navigation_util.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class ProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Function sh = sHeight(context);
    final Function sw = sWidth(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            automaticallyImplyLeading: false,
            leadingWidth: sw(80),
            leading: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(width: sw(24)),
                FYButton(
                  child: SvgPicture.asset(Images.back, height: sh(40), width: sw(40)),
                  onTap: pop,
                )
              ],
            ),
            actions: [SvgPicture.asset(Images.cart, height: sh(40), width: sw(40)), SizedBox(width: sw(24))],
            expandedHeight: sh(Dimens.k295),
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: context.theme.backgroundColor,
                child: ClipRRect(
                    child: Image.asset(Images.search_result, fit: BoxFit.cover),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(8.83),
                      bottomRight: Radius.circular(8.83),
                    )),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: sw(24)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: sh(Dimens.k8)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Jollof Rice", style: context.theme.textTheme.headline2!.copyWith(fontSize: sh(Dimens.k16))),
                              SizedBox(height: sh(10)),
                              Row(
                                children: [
                                  Transform(
                                    transform: Matrix4.identity()..scale(0.8),
                                    child: FYChip("Spicy",
                                        backgroundColor: FYColors.lighterBlack2,
                                        textColor: context.theme.textTheme.button!.color),
                                  ),
                                  Transform(
                                    transform: Matrix4.identity()..scale(0.8),
                                    child: FYChip("African",
                                        backgroundColor: FYColors.lighterBlack2,
                                        textColor: context.theme.textTheme.button!.color),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("Order Amount",
                                  style: context.theme.textTheme.headline2!.copyWith(
                                      fontSize: sh(Dimens.k12), color: FYColors.lighterBlack2, fontWeight: FontWeight.w400)),
                              Text("N 6,600", style: context.theme.textTheme.headline3!.copyWith(fontSize: sh(Dimens.k24))),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Entypo.dot_single,
                            color: context.theme.textTheme.headline3!.color,
                          ),
                          Text("Scroll down to customize your order",
                              style: context.theme.textTheme.headline3!
                                  .copyWith(fontSize: sh(Dimens.k12), fontWeight: FontWeight.w400)),
                        ],
                      ),
                      Divider(color: FYColors.subtleBlack2.withOpacity(0.8), thickness: 0.5),
                      SizedBox(height: sh(Dimens.k32)),
                      Article(
                        title: "Descriptions",
                        description:
                            "The nigerian jollof rice is known all over for it’s sweet sentilating and peppery feel, a must taste.",
                      ),
                      SizedBox(height: sh(Dimens.k32)),
                      Article(
                        title: "Ingredients",
                        description: "Rice, pepper, seasoning, salt, thyme, curry.",
                      ),
                      SizedBox(height: sh(80)),
                      FoodTableHeader(
                        leading: "Quantity",
                        trailing: "Single option",
                      ),
                      SizedBox(height: sh(Dimens.k16)),
                      ListView.separated(
                        padding: EdgeInsets.zero,
                        itemCount: 5,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) => ListTile(
                          contentPadding: EdgeInsets.symmetric(horizontal: 0.0),
                          leading: Text("1 Plate @ N2,500",
                              style: context.theme.textTheme.headline2!
                                  .copyWith(fontSize: sh(Dimens.k16), fontWeight: FontWeight.w600)),
                          trailing: Radio(
                            groupValue: null,
                            onChanged: (Null? value) {},
                            value: null,
                          ),
                        ),
                        separatorBuilder: (BuildContext context, int index) => Divider(thickness: 0.4, height: 0),
                      ),
                      Divider(thickness: 0.4, height: 0),
                      SizedBox(height: sh(Dimens.k32)),
                      FoodTableHeader(leading: "Suppliments", trailing: "Select up to 4 options"),
                      SizedBox(height: sh(Dimens.k16)),
                      ListView.separated(
                        padding: EdgeInsets.zero,
                        itemCount: 5,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) => ListTile(
                          contentPadding: EdgeInsets.symmetric(horizontal: 0.0),
                          leading: Text("Chicken @ N700",
                              style: context.theme.textTheme.headline2!
                                  .copyWith(fontSize: sh(Dimens.k16), fontWeight: FontWeight.w600)),
                          trailing: Checkbox(
                            value: true,
                            onChanged: (_) {},
                          ),
                        ),
                        separatorBuilder: (BuildContext context, int index) => Divider(thickness: 0.4, height: 0),
                      ),
                      Divider(thickness: 0.4, height: 0),
                      SizedBox(height: sh(Dimens.k32)),
                      FoodTableHeader(leading: "Extras", trailing: "Select up to 2 options"),
                      SizedBox(height: sh(Dimens.k16)),
                      ListView.separated(
                        padding: EdgeInsets.zero,
                        itemCount: 2,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) => ListTile(
                          contentPadding: EdgeInsets.symmetric(horizontal: 0.0),
                          leading: Text("Dodo @ N500",
                              style: context.theme.textTheme.headline2!
                                  .copyWith(fontSize: sh(Dimens.k16), fontWeight: FontWeight.w600)),
                          trailing: Checkbox(
                            value: true,
                            onChanged: (_) {},
                          ),
                        ),
                        separatorBuilder: (BuildContext context, int index) => Divider(thickness: 0.4, height: 0),
                      ),
                      Divider(thickness: 0.4, height: 0),
                      SizedBox(height: sh(Dimens.k32)),
                      Text(
                        "Extra Instructions",
                        style: context.theme.textTheme.headline2!.copyWith(fontSize: sh(Dimens.k14)),
                      ),
                      SizedBox(height: sh(7.0)),
                      SecondaryTextField(
                        keyboardType: TextInputType.multiline,
                        hintText: "Please indicate any allergies or specifications",
                        maxLines: 8,
                      ),
                      SizedBox(height: sh(24.0)),
                      LocalTheme(
                          child: FYTextButton(
                            text: "Add to cart",
                            onPressed: () {},
                          ),
                          buttonStyle: context.theme.textButtonTheme.style!.copyWith(
                            minimumSize: MaterialStateProperty.all<Size>(Size(double.infinity, Dimens.k57)),
                          )),
                      SizedBox(height: sh(20.0)),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
