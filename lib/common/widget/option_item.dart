import 'package:equatable/equatable.dart';
import 'package:food_yours_customer/common/view_model/selectable.dart';

// ignore: must_be_immutable
class FYOptionItem<T> extends Equatable implements Selectable {
  String name;
  T? value;

  FYOptionItem([this.name = "", this.value]);

  @override
  List get props => [name, value];
}
