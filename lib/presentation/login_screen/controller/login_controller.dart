import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tdc_mobile/core/app_export.dart';
import 'package:tdc_mobile/core/enums/enum_role.dart';
import 'package:tdc_mobile/data/apiClient/api_client.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:tdc_mobile/data/model/account_model.dart';
import 'package:tdc_mobile/data/model/cart_model.dart';

class LoginController extends GetxController with StateMixin<bool> {
  TextEditingController phoneNumberController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  final ApiClient apiClient = Get.find();
  Rx<bool> isShowPassword = true.obs;
  RxString errorMessage = "".obs;


  @override
  void onReady() {
    change(null, status: RxStatus.loading());
    if(PrefUtils.getUser() != null){
      Get.offAllNamed(AppRoutes.mainWrapper);
    }
    change(true, status: RxStatus.success());
    phoneNumberController.text = "0907078301";
    passwordController.text = "1";
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();

    phoneNumberController.dispose();
    passwordController.dispose();
  }

  Future<void> login() async {
    try {
      change(null, status: RxStatus.loading());

      String phone = phoneNumberController.text;
      String password = passwordController.text;
      final result = await apiClient.loginWithPhone(phone, password);
      if (result.statusCode == 200) {
        final Map<String, dynamic> jsonResult = json.decode(result.body);
        String roleName = jsonResult["role"]["roleName"];

        if (roleName == EnumToString.convertToString(ERole.ROLE_CUSTOMER)) {
          // save user information to local
          PrefUtils.setUser(result.body);
          String phone = jsonResult["phone"];
          if (PrefUtils.getString(phone) == null) {
            CartModel cartModel = CartModel(
                totalQuantity: 0,
                totalAmount: 0,
                phoneNumber: phone,
                listItemModel: List.empty());
             PrefUtils.saveCart(cartModel);
          }
          //

          errorMessage.value = "";
          // refreshTextEdit();
          Get.offAllNamed(AppRoutes.mainWrapper);
        } else {
          errorMessage.value = "Your role not support!";
        }
      } else if (result.statusCode == 403) {
        final jsonResult = jsonDecode(result.body);
        errorMessage.value = jsonResult["message"];
        print('Login failed: ${result.statusCode} \n ${errorMessage.value}');
      } else if (result.statusCode == 400) {
        final jsonResult = jsonDecode(result.body);
        errorMessage.value = "Cannot empty!";
        print('Login failed: ${result.statusCode} \n ${errorMessage.value}');
      } else {
        print('code" ${result.statusCode}');
      }
      change(true, status: RxStatus.success());
    } catch (error) {
      Logger.log("Error LoginController: $error");
      errorMessage.value = "Cannot connect to server!";
      // change(null, status: RxStatus.error('Error message: $error'));
      change(null, status: RxStatus.success());
    }
  }

  void refreshTextEdit() {
    phoneNumberController.clear();
    passwordController.clear();
  }

  void forgotPassword() {
    Get.toNamed(AppRoutes.forgotPasswordScreen);

    print('forgot password');
  }

  void register() {
    Get.toNamed(AppRoutes.registerScreen);
    print('forgot register');
  }
}
