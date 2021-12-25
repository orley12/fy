import 'package:flutter/material.dart';
import 'package:food_yours_customer/common/widget/option_item.dart';
import 'package:food_yours_customer/common/widget/shimmer_widget.dart';
import 'package:food_yours_customer/home/widget/suggestion_item.dart';
import 'package:food_yours_customer/resources/dimens.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class SuggestionsCard extends StatelessWidget {
  final List<FYOptionItem> options;
  final Function? onSelected;
  final RxBool isLoading;

  SuggestionsCard(
      {required this.options, this.onSelected, required this.isLoading});

  @override
  Widget build(BuildContext context) {
    Function sh = sHeight(context);
    Function sw = sWidth(context);

    return ClipRRect(
      borderRadius: BorderRadius.circular(Dimens.k12),
      child: Card(
        elevation: 8,
        shadowColor: Color.fromRGBO(0, 99, 247, 0.2),
        child: Container(
          height: sh(209),
          width: sw(329),
          padding: EdgeInsets.symmetric(horizontal: sw(15), vertical: sh(12)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Suggestions",
                  style: context.theme.textTheme.caption!.copyWith(
                      fontSize: sh(Dimens.k12), fontWeight: FontWeight.w600)),
              SizedBox(height: sh(20)),
              Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) => isLoading.value
                      ? ShimmerWidget()
                      : SuggestionItem(
                          option: options[index], onSelected: onSelected),
                  separatorBuilder: (context, index) =>
                      SizedBox(height: sh(20)),
                  itemCount: options.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
