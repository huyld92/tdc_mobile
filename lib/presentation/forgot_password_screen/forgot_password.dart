import 'package:tdc_mobile/core/utils/validation_functions.dart';
import 'package:tdc_mobile/widgets/custom_elevated_button.dart';
import 'package:tdc_mobile/widgets/custom_icon_button.dart';
import 'package:tdc_mobile/widgets/custom_text_form_field.dart';

import 'controller/forgot_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:tdc_mobile/core/app_export.dart';

class ForgotPasswordScreen extends GetWidget<ForgotPasswordController> {
  ForgotPasswordScreen({Key? key}) : super(key: key);
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
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 3.v),
            child: Column(children: [
              CustomIconButton(
                  height: 44.adaptSize,
                  width: 44.adaptSize,
                  padding: EdgeInsets.all(10.h),
                  decoration: IconButtonStyleHelper.fillPrimaryTL20,
                  alignment: Alignment.centerLeft,
                  onTap: () {
                    controller.back();
                  },
                  child: CustomImageView(imagePath: ImageConstant.imgBack)),
              SizedBox(height: 39.v),
              _buildPageTitle(),
              SizedBox(height: 39.v),
              CustomTextFormField(
                  controller: controller.phoneController,
                  hintText: "lbl_phone".tr,
                  textInputAction: TextInputAction.done,
                  textInputType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null ||
                        (!isValidPhone(value, isRequired: true))) {
                      return "err_msg_please_enter_valid_phone".tr;
                    }
                    return null;
                  }),
              SizedBox(height: 40.v),
              CustomElevatedButton(
                  text: "lbl_next".tr,
                  buttonStyle: CustomButtonStyles.fillPrimary,
                  onPressed: () {
                    controller.onTapNext();
                  }),
              SizedBox(height: 5.v)
            ]),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildPageTitle() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("lbl_forgot_password".tr,
          style: CustomTextStyles.headlineLargePrimary),
      SizedBox(height: 5.v),
      Container(
          width: 352.h,
          margin: EdgeInsets.only(right: 29.h),
          child: Text("msg_please_enter_your2".tr,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: CustomTextStyles.bodyLargePrimary.copyWith(height: 1.50)))
    ]);
  }
}
