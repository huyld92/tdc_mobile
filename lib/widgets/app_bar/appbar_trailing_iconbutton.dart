import 'package:flutter/material.dart';
import 'package:tdc_mobile/core/app_export.dart';
import 'package:tdc_mobile/widgets/custom_icon_button.dart';

// ignore: must_be_immutable
class AppbarTrailingIconButton extends StatelessWidget {
  AppbarTrailingIconButton({
    Key? key,
    this.imagePath,
    this.margin,
    this.onTap,
  }) : super(
          key: key,
        );

  String? imagePath;

  EdgeInsetsGeometry? margin;

  Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: CustomIconButton(
        height: 30.adaptSize,
        width: 30.adaptSize,
        decoration: IconButtonStyleHelper.fillPrimaryTL20,
        onTap: onTap,
        child: CustomImageView(
          imagePath: imagePath,
        ),
      ),
    );
  }
}
