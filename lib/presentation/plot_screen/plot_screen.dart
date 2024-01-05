import 'package:flutter/material.dart';
import 'package:tdc_mobile/core/app_export.dart';
import 'package:tdc_mobile/data/model/plot_model.dart';
import 'package:tdc_mobile/presentation/plot_screen/controller/plot_controller.dart';
import 'package:tdc_mobile/widgets/app_bar/appbar_title.dart';
import 'package:tdc_mobile/widgets/app_bar/custom_app_bar.dart';
import 'package:tdc_mobile/widgets/custom_elevated_button.dart';

import 'widgets/plot_item_widget.dart';

class PlotScreen extends GetWidget<PlotController> {
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: _buildAppBar(),
      body: Obx(
        () => GridView.builder(
          padding: EdgeInsets.all(20.0),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 8, // Adjust based on your grid layout
            childAspectRatio: 1.0,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
          ),
          itemCount: controller.plots.length,
          itemBuilder: (BuildContext context, int index) {
            return PlotItem(index: index);
          },
        ),
      ),
      bottomNavigationBar: CustomElevatedButton(
          margin: EdgeInsets.only(bottom: 20),

          onPressed: () {
            controller.toRegisterPlotScreen();
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
        text: '${'lbl_section: '.tr}${controller.sectionName}',
        margin: EdgeInsets.only(left: 20),
      ),
    );
  }
}
