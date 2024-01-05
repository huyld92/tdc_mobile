import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:tdc_mobile/core/app_export.dart';
import 'package:tdc_mobile/data/apiClient/api_client.dart';
import 'package:tdc_mobile/presentation/user_screen/controller/user_controller.dart';
import 'package:tdc_mobile/presentation/wallet_screen/widgets/top_up_amount.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class WalletController extends GetxController {
  RxString balance = "0.0".obs;
  TextEditingController amountController = TextEditingController();
  var isTextFieldEmpty = false.obs;
  RxInt amount = 10000.obs;

  RxList listTransaction = RxList.empty();
  ApiClient _apiClient = Get.find();

  @override
  void onReady() {}

  void getBack() {
    Get.back();
  }

  void transactionScreen() {}

  Future<void> topUpAmount() async {
    try {
      String description = "Top up amount";
      await _apiClient
          .topUpAmount(amount.value, description)
          .then((result) async {
        if (result.statusCode == 200) {
          final jsonResult = jsonDecode(result.body);
          // convert uri link
          print('uri: ${jsonResult["message"]}');
          var sandbox = Uri.parse(jsonResult["message"]);
          print(sandbox);


          if (await canLaunchUrlString(jsonResult["message"])) {
            print('open');
            await launchUrlString(jsonResult["message"]);
            // Handle post-launch operations
            print('close');

          } else {
            // Handle the error when the URL can't be launched
            print('Could not launch $jsonResult["message"]');
          }
         } else if (result.statusCode == 403) {
          UserController userController = Get.find();
          userController.logout();
        } else if (result.statusCode == 500) {
          print('error 500');
        } else {
          Logger.log("Status code: ${result.statusCode}}");
        }
      });
    } on Exception catch (error) {
      Logger.log("$error TOP_UP_AMOUNT");
    }
  }

  void addBalance() {
    Get.bottomSheet(TopUpWidget(), isDismissible: false).then((value) {
      amountController.clear();
    });
  }
}
