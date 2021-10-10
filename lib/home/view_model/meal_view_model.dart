import 'package:get/get_rx/src/rx_types/rx_types.dart';

class MealViewModel {
  String id;
  String vendorId;
  String productName;
  String productDetails;
  String amount;
  String priceArray;
  String status;
  String image;
  String productClass;
  String productType;
  String vendorImage;
  String vendorLocation;
  String vendorState;
  String offeredProduct;
  String promoted;
  String productId;
  String openingTime;
  String closingTime;
  String rating;
  String unitMeasurement;
  String mealType;
  String toppingsArray;
  String vendorAddress;
  String extras;

  String daysOfWeek;

  MealViewModel(
      [this.id = "",
      this.vendorId = "",
      this.productName = "",
      this.productDetails = "",
      this.amount = "",
      this.priceArray = "",
      this.status = "",
      this.image = "",
      this.productClass = "",
      this.productType = "",
      this.vendorImage = "",
      this.vendorLocation = "",
      this.vendorState = "",
      this.offeredProduct = "",
      this.promoted = "",
      this.productId = "",
      this.openingTime = "",
      this.closingTime = "",
      this.rating = "",
      this.unitMeasurement = "",
      this.mealType = "",
      this.toppingsArray = "",
      this.vendorAddress = "",
      this.extras = "",
      this.daysOfWeek = ""]);

  MealViewModel.fromJson(Map<String, dynamic>? json)
      : this.id = json?["id"] ?? "",
        this.vendorId = json?["vendorID"] ?? "",
        this.productName = json?["product"] ?? "",
        this.productDetails = json?["productDet"] ?? "",
        this.amount = json?["amount"] ?? "",
        this.priceArray = json?["priceArray"] ?? "",
        this.status = json?["status"] ?? "",
        this.image = json?["image"] ?? "",
        this.productClass = json?["productClass"] ?? "",
        this.productType = json?["productType"] ?? "",
        this.vendorImage = json?["vendorIMG"] ?? "",
        this.vendorLocation = json?["locationDB"] ?? "",
        this.vendorState = json?["venState"] ?? "",
        this.offeredProduct = json?["offerPRO"] ?? "",
        this.promoted = json?["promoted"] ?? "",
        this.productId = json?["productID"] ?? "",
        this.openingTime = json?["timeOpen"] ?? "",
        this.closingTime = json?["timeClosed"] ?? "",
        this.rating = json?["rating"] ?? "",
        this.unitMeasurement = json?["unitMes"] ?? "",
        this.mealType = json?["mealType"] ?? "",
        this.toppingsArray = json?["icingArray"] ?? "",
        this.vendorAddress = json?["locationV"] ?? "",
        this.extras = json?["extras"] ?? "",
        this.daysOfWeek = json?["weekdayA"] ?? "";

  static getList(List? json) {
    List<Map<String, dynamic>> meals = List<Map<String, dynamic>>.from(json ?? []);
    return List.generate(meals.length, (index) => MealViewModel.fromJson(meals[index])).obs;
  }
}
