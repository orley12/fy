// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'cart_model.g.dart';

@HiveType(typeId: 3)
class CartModel extends Equatable {
  @HiveField(0)
  late String mealName;

  @HiveField(1)
  late Map quantity;

  @HiveField(2)
  late List<Map> supplements;

  @HiveField(3)
  late List<Map> extras;

  @HiveField(4)
  late String note;

  @HiveField(5)
  late double total;

  @HiveField(6)
  late int count;

  @HiveField(7)
  late double minimumMealPrice;

  @HiveField(8)
  late String id;

  @HiveField(9)
  late String chefName;

  @HiveField(10)
  late String address;

  @HiveField(11)
  late List chefDeliveryDays;

  @HiveField(12)
  late String specifiedDeliveryAndTime;

  @HiveField(13)
  late String status;

  @HiveField(14)
  late String chefId;

  @HiveField(15)
  late String chefImageUrl;

  CartModel({
    this.id = "",
    this.mealName = "",
    this.quantity = const {},
    this.supplements = const [{}],
    this.extras = const [{}],
    this.note = "",
    this.total = 0.0,
    this.count = 0,
    this.minimumMealPrice = 0.0,
    this.chefName = "",
    this.address = "",
    this.chefDeliveryDays = const [],
    this.specifiedDeliveryAndTime = "",
    this.status = "",
    this.chefId = "",
    this.chefImageUrl = "",
  });

  @override
  String toString() {
    return 'CartModel{id: $id, mealName: $mealName, quantity: $quantity, suppliments: $supplements, extras: $extras, note: $note, total: $total, count: $count, minimumMealPrice: $minimumMealPrice, chefName: $chefName, address: $address, chefDeliveryDays: $chefDeliveryDays, specifiedDeliveryAndTime: $specifiedDeliveryAndTime, chefId: $chefId, chefImageUrl: $chefImageUrl}';
  }

  @override
  List<Object?> get props => [
        mealName,
        quantity,
        supplements,
        extras,
        note,
        total,
        chefName,
        minimumMealPrice
      ];
}
