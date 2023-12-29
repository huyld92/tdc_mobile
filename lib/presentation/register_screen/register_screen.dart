import 'package:tdc_mobile/core/utils/validation_functions.dart';
import 'package:tdc_mobile/widgets/custom_elevated_button.dart';
import 'package:tdc_mobile/widgets/custom_icon_button.dart';
import 'package:tdc_mobile/widgets/custom_radio_button.dart';
import 'package:tdc_mobile/widgets/custom_text_form_field.dart';

import 'controller/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:tdc_mobile/core/app_export.dart';

class RegisterScreen extends GetWidget<RegisterController> {
  RegisterScreen({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: appTheme.blue,
        body: Form(
          key: _formKey,
          child: GestureDetector(
            onTap: () {
               FocusManager.instance.primaryFocus?.unfocus();
            },
            child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 3.v),
              child: Column(children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: CustomIconButton(
                      height: 44.adaptSize,
                      width: 44.adaptSize,
                      padding: EdgeInsets.all(10.h),
                      decoration: IconButtonStyleHelper.fillPrimary,
                      alignment: Alignment.centerLeft,
                      onTap: () {
                        controller.back();
                      },
                      child: CustomImageView(imagePath: ImageConstant.imgBack)),
                ),
                SizedBox(height: 37.v),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text("msg_create_a_new_account".tr,
                        style: CustomTextStyles.headlineLargePrimary)),
                SizedBox(height: 21.v),
                _buildFullName(),
                SizedBox(height: 16.v),
                _buildPhone(),
                SizedBox(height: 16.v),
                _buildDateOfBirth(),
                SizedBox(height: 26.v),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text("lbl_gender".tr,
                        style: theme.textTheme.titleMedium)),
                SizedBox(height: 8.v),
                _buildGender(),
                SizedBox(height: 25.v),
                _buildRegister(),
                SizedBox(height: 5.v)
              ]),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFullName() {
    return CustomTextFormField(
      controller: controller.fullNameController,
      hintText: "lbl_fullName".tr,
      textInputType: TextInputType.emailAddress,
      validator: (value) {
        if (!isText(value)) {
          return "err_msg_please_enter_valid_text".tr;
        }
        return null;
      },
    );
  }

  /// Section Widget
  Widget _buildPhone() {
    return CustomTextFormField(
        controller: controller.phoneController,
        hintText: "lbl_phone".tr,
        textInputType: TextInputType.phone,
        validator: (value) {
          if (!isValidPhone(value)) {
            return "err_msg_please_enter_valid_phone_number".tr;
          }
          return null;
        });
  }

  /// Section Widget
  Widget _buildDateOfBirth() {
    return CustomTextFormField(
        controller: controller.dateOfBirthController,
        hintText: "lbl_date_of_birth".tr,
        textInputAction: TextInputAction.done,
        suffix: Container(
            margin: EdgeInsets.fromLTRB(30.h, 13.v, 16.h, 13.v),
            child: CustomImageView(
              imagePath: ImageConstant.imgCalender,
              height: 24.adaptSize,
              width: 24.adaptSize,
              color: appTheme.white,
            )),
        suffixConstraints: BoxConstraints(maxHeight: 50.v),
        contentPadding: EdgeInsets.only(left: 16.h, top: 15.v, bottom: 15.v));
  }

  /// Section Widget
  Widget _buildGender() {
    return Obx(() => Row(children: [
          CustomRadioButton(
              text: "lbl_female".tr,
              value: controller.eGender[0],
              groupValue: controller.gender.value,
              padding: EdgeInsets.fromLTRB(8.h, 14.v, 30.h, 14.v),
              onChange: (value) {
                controller.gender.value = value;
              }),
          Padding(
              padding: EdgeInsets.only(left: 16.h),
              child: CustomRadioButton(
                  text: "lbl_male".tr,
                  value: controller.eGender[1],
                  groupValue: controller.gender.value,
                  padding: EdgeInsets.fromLTRB(8.h, 14.v, 30.h, 14.v),
                  onChange: (value) {
                    controller.gender.value = value;
                  }))
        ]));
  }

  /// Section Widget
  Widget _buildRegister() {
    return CustomElevatedButton(
        text: "lbl_register".tr, buttonStyle: CustomButtonStyles.fillPrimary);
  }
}
