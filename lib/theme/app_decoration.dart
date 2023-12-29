import 'package:flutter/material.dart';
import 'package:tdc_mobile/core/app_export.dart';

class AppDecoration {
  static BoxDecoration get gradientBlue600Blue700 => BoxDecoration(
        gradient: LinearGradient(
          begin: const Alignment(-0.2, 0.46),
          end: const Alignment(0.72, 0.86),
          colors: [
            ColorConstant.blue600,
            ColorConstant.blue700,
          ],
        ),
      );

  static BoxDecoration get outlineBlueA700 => BoxDecoration(
        color: ColorConstant.blue50,
        border: Border.all(color: ColorConstant.blueA700, width: 1.h),
      );

  static BoxDecoration get fillBlue50 => BoxDecoration(
        color: appTheme.blue50,
      );

  static BoxDecoration get fillWhiteA700 => BoxDecoration(
        color: theme.primaryColor,
      );
}

class BorderRadiusStyle {
  static BorderRadius roundedBorder6 = BorderRadius.circular(6.h);

  static BorderRadius customBorderTL30 = BorderRadius.only(
    topLeft: Radius.circular(30.h),
    topRight: Radius.circular(30.h),
  );
}
