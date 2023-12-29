import 'package:flutter/cupertino.dart';
import 'package:tdc_mobile/core/app_export.dart';
import 'package:tdc_mobile/presentation/wallet_screen/widgets/top_up_amount.dart';

class WalletController extends GetxController {
  RxString balance = "0.0".obs;
  TextEditingController amountController = TextEditingController();
  var isTextFieldEmpty = false.obs;

   RxDouble amount = 0.0.obs;

  RxList listTransaction = RxList.empty();

  @override
  void onReady() {}

  void getBack() {
    Get.back();
  }


  void transactionScreen() {}

  void topUpAmount() {}

  void addBalance() {
    Get.bottomSheet(TopUpWidget(), isDismissible: false).then((value) {
      amountController.clear();
    });
  }
}
