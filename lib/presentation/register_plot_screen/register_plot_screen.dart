import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tdc_mobile/core/app_export.dart';
import 'package:tdc_mobile/core/utils/validation_functions.dart';
import 'package:tdc_mobile/presentation/register_plot_screen/controller/register_plot_controller.dart';
import 'package:tdc_mobile/widgets/app_bar/custom_app_bar.dart';
import 'package:tdc_mobile/widgets/custom_elevated_button.dart';
import 'package:tdc_mobile/widgets/custom_text_form_field.dart';

import '../../widgets/app_bar/appbar_title.dart';

class RegisterPlotScreen extends GetWidget<RegisterPlotController> {
  // Form key to validate the form
  RegisterPlotScreen({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
       body: Container(

       ),
       bottomNavigationBar: CustomElevatedButton(
          margin: EdgeInsets.only(bottom: 20),
          onPressed: () {
            controller.registerPlot();
          },
          text: "lbl_register_plot".tr,
          buttonStyle: CustomButtonStyles.outlineBlue200),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
      height: 54.v,
      leadingWidth: 40,
      leading: CustomImageView(
          imagePath: ImageConstant.imgBack,
          height: 24.adaptSize,
          width: 24.adaptSize,
          margin: const EdgeInsets.only(left: 16, top: 13, bottom: 17),
          onTap: () {
            controller.getBack();
          }),
      centerTitle: false,
      title: AppbarTitle(
        text: 'lbl_register_plot'.tr,
        margin: EdgeInsets.only(left: 20),
      ),
    );
  }
}
