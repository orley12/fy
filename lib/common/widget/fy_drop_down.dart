import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:food_yours_customer/util/responsive_screen_util.dart';

class FYDropDownItem<T> extends Equatable {
  final String name;
  final T value;
  FYDropDownItem(this.name, this.value);

  @override
  List<Object> get props => [name, value!];
}

class FYDropDownButton<T> extends StatelessWidget {
  final List<FYDropDownItem<T>> options; //

  final Function(FYDropDownItem<T>) onChanged; //

  final String hintText; //

  final FYDropDownItem<T>? selectedOption;

  final String errorMessage;

  final FocusNode? focusNode;

  final bool isExpanded;

  final Color borderColor;

  FYDropDownButton({
    required this.options,
    required this.onChanged,
    required this.hintText,
    required this.errorMessage,
    this.focusNode,
    this.selectedOption,
    this.isExpanded = false,
    this.borderColor = Colors.transparent,
  });

  @override
  Widget build(BuildContext context) {
    final sh = sHeight(context);
    final sw = sWidth(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: sh(50.99),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(6.0)),
              border: Border.all(color: errorMessage.isEmpty ? borderColor : Colors.red, style: BorderStyle.solid, width: 0.3)),
          child: DropdownButtonHideUnderline(
            child: ButtonTheme(
              alignedDropdown: true,
              // focusColor: yellow,
              // disabledColor: gray3,
              // splashColor: yellow,
              child: DropdownButton<FYDropDownItem<T>>(
                isExpanded: isExpanded,
                dropdownColor: Colors.white,
                focusNode: focusNode,
                style: Theme.of(context).textTheme.headline5!.copyWith(fontSize: sh(13), fontWeight: FontWeight.w400),
                onTap: () {
                  FocusScope.of(context).requestFocus(new FocusNode());
                },
                hint: Text(
                  hintText,
                  maxLines: 1,
                  style: Theme.of(context).textTheme.headline5!.copyWith(fontSize: sh(16)),
                ),
                value: selectedOption,
                items: _getDropdownItems(context, options, sh, sw),
                onChanged: (FYDropDownItem<T>? value) => onChanged(value!),
              ),
            ),
          ),
        ),
        SizedBox(
          height: (1),
        ),
        errorMessage.isEmpty ? Container() : Text(errorMessage, style: TextStyle(fontSize: sh(12), color: Colors.red))
      ],
    );
  }

  List<DropdownMenuItem<FYDropDownItem<T>>>? _getDropdownItems(
      BuildContext context, List<FYDropDownItem<T>> items, Function sh, Function sw) {
    // ignore: unnecessary_null_comparison
    if (items == null || items.length < 1) {
      return null;
    } else {
      return items
          .map((item) => DropdownMenuItem(
                child: Text(
                  item.name,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: Theme.of(context).textTheme.headline5!.copyWith(fontSize: sh(13)),
                ),
                value: item,
              ))
          .toList();
    }
  }
}
