import 'package:flutter/material.dart';
import 'package:tdc_mobile/core/app_export.dart';
import 'package:tdc_mobile/core/utils/validation_functions.dart';
import 'package:tdc_mobile/presentation/login_screen/controller/login_controller.dart';
import 'package:tdc_mobile/widgets/custom_elevated_button.dart';
import 'package:tdc_mobile/widgets/custom_icon_button.dart';
import 'package:tdc_mobile/widgets/custom_outlined_button.dart';
import 'package:tdc_mobile/widgets/custom_text_form_field.dart';

class LoginScreen extends GetWidget<LoginController> {
  LoginScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: appTheme.blue,
        body: controller.obx((state) => Form(
            key: _formKey,
            child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 3.v),
              child: Column(children: [
                SizedBox(height: 100.v),
                _buildPageTitle(),
                SizedBox(height: 20.v),
                Obx(
                  () => Visibility(
                    visible: controller.errorMessage.isNotEmpty,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        controller.errorMessage.value,
                        style: CustomTextStyles.bodyLargeRed400,
                        maxLines: 1,
                      ),
                    ),
                  ),
                ),
                CustomTextFormField(
                  autofocus: false,
                  controller: controller.phoneNumberController,
                  hintText: "lbl_phone".tr,
                  textInputType: TextInputType.phone,
                  // validator: (value) {
                  //   if (value == null ||
                  //       (!isValidPhone(value, isRequired: true))) {
                  //     return "err_msg_please_enter_valid_phone".tr;
                  //   }
                  //   return null;
                  // }
                ),
                SizedBox(height: 24.v),
                Obx(() => CustomTextFormField(
                    autofocus: false,
                    controller: controller.passwordController,
                    hintText: "lbl_password".tr,
                    textInputAction: TextInputAction.done,
                    textInputType: TextInputType.visiblePassword,
                    suffix: InkWell(
                        onTap: () {
                          controller.isShowPassword.value =
                              !controller.isShowPassword.value;
                        },
                        child: Container(
                            margin: EdgeInsets.fromLTRB(30.h, 13.v, 16.h, 13.v),
                            child: CustomImageView(
                                imagePath: controller.isShowPassword.value
                                    ? ImageConstant.imgEyeVisible
                                    : ImageConstant.imgEyeInVisible,
                                height: 24.adaptSize,
                                width: 24.adaptSize))),
                    suffixConstraints: BoxConstraints(maxHeight: 50.v),
                    // validator: (value) {
                    //   if (value == null ||
                    //       (!isValidPassword(value, isRequired: true))) {
                    //     return "err_msg_please_enter_valid_password".tr;
                    //   }
                    //   return null;
                    // },
                    obscureText: controller.isShowPassword.value,
                    contentPadding:
                        EdgeInsets.only(left: 16.h, top: 15.v, bottom: 15.v))),
                SizedBox(height: 27.v),
                Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                        onTap: () {
                          controller.forgotPassword();
                        },
                        child: Text("msg_forgot_your_login".tr,
                            style: CustomTextStyles.bodyLargePrimary))),
                SizedBox(height: 10.v),
                Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                        onTap: () {
                          controller.register();
                        },
                        child: Text("lbl_register".tr,
                            style: CustomTextStyles.bodyLargePrimary))),
                SizedBox(height: 30.v),
                CustomElevatedButton(
                  onPressed: () {
                    FocusManager.instance.primaryFocus?.unfocus();
                    print('login');
                    controller.login();
                  },
                  text: "lbl_login".tr,
                  buttonStyle: CustomButtonStyles.fillPrimary,
                ),
              ]),
            )),
          onLoading:  Center(child: CircularProgressIndicator()),
          // onError: Container(child: Center(child: Text()),);
        ),
      ),
    ));
  }

  /// Section Widget
  Widget _buildPageTitle() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("msg_welcome_to_tdc".tr,
          style: CustomTextStyles.headlineLargePrimary),
      SizedBox(height: 12.v),
      Text("msg_please_enter_your".tr, style: CustomTextStyles.bodyLargePrimary)
    ]);
  }
}
