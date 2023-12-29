import 'package:tdc_mobile/core/app_export.dart';
import 'package:flutter/material.dart';

class WalletTransactionEmpty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.maxFinite,
        padding: EdgeInsets.only(top: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomImageView(
                imagePath: ImageConstant.imgNotFound,
                height: 204.v,
                width: 255.h),

            Padding(
                padding: EdgeInsets.only(top: 15),
                child: Text("lbl_no_data_found".tr,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: CustomTextStyles.titleLarge16Gray900.copyWith(
                        letterSpacing: 0.20.h,
                        height: 0.99.v))),
          ],
        ));
  }
}
