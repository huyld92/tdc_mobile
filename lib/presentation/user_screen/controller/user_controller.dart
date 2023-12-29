import 'dart:convert';

import 'package:tdc_mobile/core/app_export.dart';
import 'package:tdc_mobile/data/apiClient/api_client.dart';

class UserController extends GetxController {
  final ApiClient apiClient = Get.find();
  RxString userName = "".obs;
  int _userID = -1;

  @override
  void onReady() {
    var user = jsonDecode(PrefUtils.getUser()!);

     userName.value = user["fullName"];
    _userID = user["id"];
  }

  Future<void> logout() async {
    try {
      final result = await apiClient.logout();

      PrefUtils.logout();
      if (result.statusCode == 200) {
        await Get.offNamed(AppRoutes.loginScreen);
      } else if (result.statusCode == 403) {
        await Get.offNamed(AppRoutes.loginScreen);
      } else {
        print('USERCONTROLLER logout: " ${result.statusCode}');
      }
    } catch (error) {
      Logger.log("Error UserController logout: $error");
    }
  }

  void toProfileSCreen() {
    print('to Profile Screen');
    Get.toNamed(AppRoutes.profileScreen, arguments: _userID)!.then((value) => {});
  }

  void toWalletScreen() {
    print('to Wallet Screen');
    Get.toNamed(AppRoutes.walletScreen )!.then((value) => {});

  }
}
