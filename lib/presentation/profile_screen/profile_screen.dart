import 'package:tdc_mobile/widgets/app_bar/appbar_title.dart';
import 'package:tdc_mobile/widgets/app_bar/custom_app_bar.dart';
import 'package:tdc_mobile/widgets/custom_icon_button.dart';

import 'controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:tdc_mobile/core/app_export.dart';

class ProfileScreen extends GetWidget<ProfileController> {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(vertical: 21.v),
          child: Column(children: [
            SizedBox(
              height: 126.v,
              width: 124.h,
              child: Stack(alignment: Alignment.bottomRight, children: [
                CustomImageView(
                    imagePath: ImageConstant.imgAvatar,
                    height: 120.adaptSize,
                    width: 120.adaptSize,
                    radius: BorderRadius.circular(60.h),
                    alignment: Alignment.topLeft),
                CustomIconButton(
                  height: 40.adaptSize,
                  width: 40.adaptSize,
                  padding: const EdgeInsets.all(4),
                  alignment: Alignment.bottomRight,
                  decoration: IconButtonStyleHelper.fillBlue200TL20,
                  onTap: () {
                    print("Ontap camera icon");
                  },
                  child: CustomImageView(
                      imagePath: ImageConstant.imgNotFound,
                      color: appTheme.white),
                )
              ]),
            ),
            SizedBox(height: 46.v),
            Obx(
              () => Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.h),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                            padding: EdgeInsets.only(bottom: 1.v),
                            child: Text("lbl_phone".tr,
                                style: CustomTextStyles.bodyLarge18
                                    .copyWith(color: appTheme.blueGray400))),
                        Text(controller.accountModel.value.phone,
                            style: CustomTextStyles.bodyLarge18Black90001
                                .copyWith(color: appTheme.black90001))
                      ])),
            ),
            const Divider(),
            SizedBox(height: 29.v),
            Obx(() => Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.h),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                          padding: EdgeInsets.only(bottom: 1.v),
                          child: Text("lbl_fullName".tr,
                              style: CustomTextStyles.bodyLarge18
                                  .copyWith(color: appTheme.blueGray400))),
                      Text(controller.accountModel.value.fullName,
                          style: CustomTextStyles.bodyLarge18Black90001
                              .copyWith(color: appTheme.black90001))
                    ]))),
            SizedBox(height: 28.v),
            Obx(() => Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.h),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                          padding: EdgeInsets.only(bottom: 1.v),
                          child: Text("lbl_gender".tr,
                              style: CustomTextStyles.bodyLarge18
                                  .copyWith(color: appTheme.blueGray400))),
                      Text(controller.accountModel.value.gender.toString(),
                          style: CustomTextStyles.bodyLarge18Black90001
                              .copyWith(color: appTheme.black90001))
                    ]))),
            SizedBox(height: 37.v),
            Obx(() => Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.h),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                          padding: EdgeInsets.only(bottom: 1.v),
                          child: Text("lbl_date_of_birth".tr,
                              style: CustomTextStyles.bodyLarge18
                                  .copyWith(color: appTheme.blueGray400))),
                      Text(controller.accountModel.value.birthday.format(),
                          style: CustomTextStyles.bodyLarge18Black90001
                              .copyWith(color: appTheme.black90001))
                    ]))),
          ]),
        ),
      ),
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
      centerTitle: true,
      title: AppbarTitle(
        text: "lbl_shopping_cart".tr,
      ),
    );
  }
}
