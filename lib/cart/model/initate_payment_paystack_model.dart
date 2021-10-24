import 'package:food_yours_customer/common/model/model.dart';

class InitiatePaymentPaystackModel extends Model {
  final String amount;
  final String email;

  InitiatePaymentPaystackModel([this.amount = "", this.email = ""]);

  @override
  Map<String, dynamic> toJSON() {
    return {
      "email": email,
      "amount": amount,
    };
  }
}
