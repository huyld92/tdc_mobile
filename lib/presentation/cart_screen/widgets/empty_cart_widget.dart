import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tdc_mobile/core/app_export.dart';
import 'package:tdc_mobile/presentation/cart_screen/controller/cart_controller.dart';
import 'package:tdc_mobile/widgets/custom_elevated_button.dart';

class EmptyCartWidget extends StatelessWidget {
  const EmptyCartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomImageView(
              imagePath: ImageConstant.imgCart,
              height: 100.adaptSize,
              color: appTheme.gray600,
            ),
            Text(
              'lbl_your_cart_empty'.tr,
              style: CustomTextStyles.titleMediumBlueGray40018,
            ),
            CustomElevatedButton(
              onPressed: () {
                CartController controller = Get.find();
                controller.getBack();
              },
              margin: const EdgeInsets.only(top: 20),
              text: "lbl_go_service_screen".tr,
              buttonTextStyle: CustomTextStyles.titleLargeWhite18,
              width: 200.h,
              buttonStyle: CustomButtonStyles.outlinePrimary,
            )
          ],
        ),
      ),
    );
  }
}
