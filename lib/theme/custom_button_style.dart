import 'package:flutter/material.dart';
import 'package:tdc_mobile/core/app_export.dart';

class CustomButtonStyles {
  static ButtonStyle get fillPrimary => ElevatedButton.styleFrom(
        backgroundColor: theme.colorScheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.h),
        ),
      );

  static ButtonStyle get outlinePrimary => OutlinedButton.styleFrom(
        backgroundColor: appTheme.blue200,
        side: BorderSide(
          color: theme.colorScheme.primary,
          width: 1,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.h),
        ),
      );

  static ButtonStyle get outlineBlue200 => OutlinedButton.styleFrom(
        backgroundColor: theme.colorScheme.primary,
        side: BorderSide(
          color: appTheme.blue200,
          width: 1,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.h),
        ),
      );
}
