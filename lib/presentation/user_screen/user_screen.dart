import 'package:tdc_mobile/widgets/custom_icon_button.dart';

import 'controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:tdc_mobile/core/app_export.dart';

class UserScreen extends GetWidget<UserController> {
  const UserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        body: Container(
          width: mediaQueryData.size.width,
          height: mediaQueryData.size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: const Alignment(-0.2, 0.46),
                  end: const Alignment(0.72, 0.86),
                  colors: [ColorConstant.blue600, ColorConstant.blue700])),
          child: Container(
            width: double.maxFinite,
            decoration: AppDecoration.gradientBlue600Blue700,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 125.v,
                      width: 124.h,
                      margin: const EdgeInsets.only(top: 20),
                      child: Stack(alignment: Alignment.bottomRight, children: [
                        CustomImageView(
                            imagePath: ImageConstant.imgAvatar,
                            height: 123.adaptSize,
                            width: 123.adaptSize,
                            radius: BorderRadius.circular(60.h),
                            alignment: Alignment.center),
                        CustomIconButton(
                          height: 40.adaptSize,
                          width: 40.adaptSize,
                          padding: const EdgeInsets.all(4),
                          alignment: Alignment.bottomRight,
                          decoration: IconButtonStyleHelper.fillPrimaryTL20,
                          onTap: () {
                            print("Ontap camera icon");
                          },
                          child: CustomImageView(
                              imagePath: ImageConstant.imgNotFound),
                        )
                      ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Obx(
                        () => Text(controller.userName.value,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: CustomTextStyles.titleLargeWhite18),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(top: 41),
                    padding: const EdgeInsets.fromLTRB(20, 31, 20, 31),
                    decoration: AppDecoration.fillWhiteA700.copyWith(
                        borderRadius: BorderRadiusStyle.customBorderTL30),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        //Profile
                        InkWell(
                          onTap: () {
                            controller.toProfileSCreen();
                          },
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomIconButton(
                                  height: 40.adaptSize,
                                  width: 40.adaptSize,
                                  onTap: () {
                                    print('Profile Icon');
                                  },
                                  padding: const EdgeInsets.all(10),
                                  decoration:
                                  IconButtonStyleHelper.fillBlue50TL20,
                                  child: CustomImageView(
                                      imagePath: ImageConstant.imgProfile,
                                      color: appTheme.blue500),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 18, top: 13, bottom: 10),
                                  child: Text("lbl_profile".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: CustomTextStyles
                                          .titleLarge16Gray900),
                                ),
                                const Spacer(),
                                CustomImageView(
                                  imagePath: ImageConstant.imgArrowRight,
                                  height: 24.adaptSize,
                                  width: 24.adaptSize,
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 10),
                                )
                              ]),
                        ),
                        Padding(
                            padding:
                            const EdgeInsets.symmetric(vertical: 13),
                            child: Divider(
                                height: 1.v,
                                thickness: 1.v,
                                color: ColorConstant.blueGray50)),
                        //Wallets
                        InkWell(
                          onTap: () {
                            controller.toWalletScreen();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomIconButton(
                                height: 40.adaptSize,
                                width: 40.adaptSize,
                                padding: const EdgeInsets.all(10),
                                decoration:
                                IconButtonStyleHelper.fillBlue50TL20,
                                child: CustomImageView(
                                  imagePath: ImageConstant.imgWallet,
                                  color: appTheme.blue500,
                                ),
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(
                                      left: 18, top: 13, bottom: 10),
                                  child: Text("lbl_wallet".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: CustomTextStyles
                                          .titleLarge16Gray900)),
                              const Spacer(),
                              CustomImageView(
                                imagePath: ImageConstant.imgArrowRight,
                                height: 24.adaptSize,
                                width: 24.adaptSize,
                                margin: const EdgeInsets.symmetric(
                                    vertical: 10),
                              )
                            ],
                          ),
                        ),
                        Padding(
                            padding:
                            const EdgeInsets.symmetric(vertical: 13),
                            child: Divider(
                                height: 1.v,
                                thickness: 1.v,
                                color: ColorConstant.blueGray50)),
                        //Logout
                        InkWell(
                          onTap: () {
                            controller.logout();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomIconButton(
                                height: 40.adaptSize,
                                width: 40.adaptSize,
                                padding: const EdgeInsets.all(10),
                                decoration:
                                IconButtonStyleHelper.fillRed50TL20,
                                child: CustomImageView(
                                  imagePath: ImageConstant.imgLogout,
                                  color: appTheme.red400,
                                ),
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(
                                      left: 18, top: 13, bottom: 10),
                                  child: Text("lbl_logout".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: CustomTextStyles
                                          .titleLarge16Red700)),
                              const Spacer(),
                              CustomImageView(
                                imagePath: ImageConstant.imgArrowRight,
                                height: 24.adaptSize,
                                width: 24.adaptSize,
                                margin: const EdgeInsets.symmetric(
                                    vertical: 10),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
