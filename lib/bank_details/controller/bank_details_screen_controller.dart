import 'package:food_yours_customer/fund_wallet/screen/fund_wallet.dart';
import 'package:food_yours_customer/util/navigation_util.dart';
import 'package:food_yours_customer/wallet_withdrawal/screen/wallet_withdrawal.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class BankDetailsScreenController extends GetxController {
  gotoNextScreen() => push(page: WalletWithdrawalScreen());
}
