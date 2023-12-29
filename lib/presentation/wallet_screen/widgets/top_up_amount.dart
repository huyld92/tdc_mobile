import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:tdc_mobile/widgets/app_bar/appbar_trailing_iconbutton.dart';
import 'package:tdc_mobile/widgets/app_bar/custom_app_bar.dart';
import 'package:tdc_mobile/widgets/custom_elevated_button.dart';

import '../../../core/app_export.dart';
import '../controller/wallet_controller.dart';

class TopUpWidget extends StatelessWidget {
  WalletController controller = Get.find();

  TopUpWidget({super.key});

  final NumberFormat _currencyFormatter =
      NumberFormat.currency(locale: 'vi_VN', symbol: '');

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: 360.v,
        padding: EdgeInsets.only(bottom: 30),
        decoration: BoxDecoration(color: appTheme.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomAppBar(
              height: 80.v,
              leadingWidth: 64,
              leading: AppbarTrailingIconButton(
                  // height: getSize(32),
                  // width: getSize(32),
                  imagePath: ImageConstant.imgBack,
                  margin: EdgeInsets.only(left: 16, top: 12, bottom: 17),
                  onTap: () {
                    controller.getBack();
                  }),
              title: Text("lbl_enter_top_up_amount".tr,
                  style: CustomTextStyles.headlineSmall18),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.centerRight,
                  children: [
                    TextField(
                      controller: controller.amountController,
                      textAlign: TextAlign.center,
                      // textDirection: TextDirection.LTR,
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      autofocus: true,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        // CurrencyFormatter(_currencyFormatter),
                        LengthLimitingTextInputFormatter(10),
                      ],
                      maxLengthEnforcement:
                          MaxLengthEnforcement.truncateAfterCompositionEnds,
                      decoration: InputDecoration(
                          hintText: '0',
                          border: InputBorder.none,
                          hintStyle:
                              CustomTextStyles.headlineLarge20BlueGray700),
                      style: CustomTextStyles.headlineLarge20BlueGray700,
                      onChanged: (text) {
                        double amount = double.tryParse(text) ?? 0.0;
                        controller.amount.value = amount;
                        if (text.isEmpty) {
                          controller.isTextFieldEmpty.value = true;
                        } else {
                          if (amount < 10000) {
                            controller.isTextFieldEmpty.value = true;
                          } else {
                            controller.isTextFieldEmpty.value = false;
                          }
                        }
                      },
                    ),
                    // Padding(
                    //   padding: EdgeInsets.only(right: 10.0),
                    //   child: Text(
                    //     _currencyFormatter.currencySymbol,
                    //     style: TextStyle(fontSize: 16.0),
                    //   ),
                    // ),
                  ],
                ),
                if (controller.amount.value > 0 &&
                    controller.amount.value < 10000)
                  Obx(
                    () => Text("Minimum amount: 10.000đ",
                        style: controller.amount.value == 0
                            ? CustomTextStyles.titleLarge16Gray900
                            : CustomTextStyles.titleLarge16Gray900),
                  )
                else
                  Obx(
                    () => Text("${'lbl_current_balance'.tr} ${controller.balance.value}",
                        style: controller.amount.value == 0
                            ? CustomTextStyles.titleLarge16Gray900
                            : CustomTextStyles.titleLarge16Gray900),
                  ),
                CustomElevatedButton(
                  height: 56.v,
                  width: 327.h,
                  text: "lbl_next".tr,
                  margin: EdgeInsets.only(top: 20, bottom: 5),
                  buttonStyle: CustomButtonStyles.outlineBlue200,
                  onPressed: () {
                    if (controller.amount.value >= 10000) {
                      Get.back();
                      controller.topUpAmount();
                    }
                    // controller.testDeeplink();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
