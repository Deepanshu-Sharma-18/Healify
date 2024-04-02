import 'package:get/get.dart';

class LoginController extends GetxController {
  RxString _accountNo = "".obs;
  RxString _balance = "".obs;

  String get accountNo => _accountNo.value;
  String get balance => _accountNo.value;

  void updateAccountNo(String accountNo) {
    _accountNo.value = accountNo;
    update();
  }

  void updateBalance(String balance) {
    _balance.value = balance;
    update();
  }
}
