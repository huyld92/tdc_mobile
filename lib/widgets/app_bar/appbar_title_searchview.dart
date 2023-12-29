import 'package:flutter/material.dart';
import 'package:tdc_mobile/core/app_export.dart';
import 'package:tdc_mobile/widgets/custom_search_view.dart';

// ignore: must_be_immutable
class AppbarTitleSearchView extends StatelessWidget {
  AppbarTitleSearchView({
    Key? key,
    this.hintText,
    this.controller,
    this.margin,
  }) : super(
          key: key,
        );

  String? hintText;

  TextEditingController? controller;

  EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: CustomSearchView(
        width: 323.h,
        controller: controller,
        hintText: "lbl_search".tr,
        autofocus: false,
      ),
    );
  }
}
