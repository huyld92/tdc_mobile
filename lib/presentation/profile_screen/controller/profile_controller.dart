import 'dart:convert';

import 'package:tdc_mobile/core/app_export.dart';
import 'package:tdc_mobile/data/apiClient/api_client.dart';
import 'package:tdc_mobile/data/model/account_model.dart';

import '../../user_screen/controller/user_controller.dart';

class ProfileController extends GetxController {
    Rx<AccountModel>  accountModel = AccountModel.empty().obs;

  final ApiClient _apiClient = Get.find();

  @override
  Future<void> onInit() async {
    int accountID = Get.arguments;

    await getProfile(accountID);
    super.onInit();
  }

  void getBack() {
    Get.back();
  }

  Future<void> getProfile(int accountID) async {
    try {
      await _apiClient.getProfileByID(accountID).then((result) {
        if (result.statusCode == 200) {
          final jsonResult = jsonDecode(utf8.decode(result.bodyBytes));

          AccountModel accountModel = AccountModel.fromJson(jsonResult);
          this.accountModel.value = accountModel;

          print('account: ${accountModel.toString()}');
        } else if (result.statusCode == 403) {
          UserController userController = Get.find();
          userController.logout();
        } else if (result.statusCode == 500) {
          print('error 500');
        } else {
          Logger.log("Status code: ${result.statusCode}}");
        }
      });
    } catch (error) {
      Logger.log(error.toString());
    }
  }
}
