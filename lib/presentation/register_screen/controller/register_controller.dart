import 'package:flutter/cupertino.dart';
import 'package:tdc_mobile/core/app_export.dart';
import 'package:tdc_mobile/core/enums/enum_gender.dart';

class RegisterController extends GetxController {
  TextEditingController fullNameController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController dateOfBirthController = TextEditingController();

  RxList<EGender> eGender = EGender.values.obs;

  Rx<EGender> gender = EGender.Other.obs;

  @override
  void onClose() {
    super.onClose();
    fullNameController.dispose();
    phoneController.dispose();
    dateOfBirthController.dispose();
  }

  void back() {
    Get.back();
  }
}
