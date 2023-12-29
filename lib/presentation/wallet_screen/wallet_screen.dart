import 'package:tdc_mobile/presentation/wallet_screen/widgets/wallet_trasaction_empty.dart';
import 'package:tdc_mobile/widgets/app_bar/appbar_title.dart';
import 'package:tdc_mobile/widgets/app_bar/custom_app_bar.dart';
import 'package:tdc_mobile/widgets/custom_icon_button.dart';

import 'controller/wallet_controller.dart';
import 'package:flutter/material.dart';
import 'package:tdc_mobile/core/app_export.dart';

class WalletScreen extends GetWidget<WalletController> {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    ));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
      height: 54.v,
      leadingWidth: 40,
      leading: CustomImageView(
          imagePath: ImageConstant.imgBack,
          height: 40.adaptSize,
          width: 40.adaptSize,
          margin: const EdgeInsets.only(left: 16, top: 13, bottom: 17),
          onTap: () {
            controller.getBack();
          }),
      centerTitle: true,
      title: AppbarTitle(
        text: "lbl_wallet".tr,
      ),
    );
  }

  _buildBody() {
    return Container(
      height: 825.v,
      width: double.maxFinite,
      padding: EdgeInsets.only(left: 16, top: 23, right: 16, bottom: 23),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Align(
              alignment: Alignment.topCenter,
              child: Padding(
                  padding: EdgeInsets.only(top: 114),
                  child: SizedBox(
                      width: 396.h,
                      child: Divider(
                          height: 1.v,
                          thickness: 1.v,
                          color: ColorConstant.blueGray100)))),
          Align(
              alignment: Alignment.topCenter,
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("lbl_available_balance".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: CustomTextStyles.titleMedium16BlueGray500),
                    Padding(
                      padding: EdgeInsets.only(top: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Obx(
                            () => Text("${controller.balance}VND",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: CustomTextStyles.titleSmall30BlueA700),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 40),
                            child: CustomIconButton(
                              width: 40.adaptSize,
                              height: 40.adaptSize,
                              padding: EdgeInsets.all(5),
                              decoration:
                                  IconButtonStyleHelper.fillBlueA700TL20,
                              child: CustomImageView(
                                imagePath: ImageConstant.imgTopUp,
                                color: appTheme.white,
                              ),
                              onTap: () {
                                controller.addBalance();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(top: 46),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("lbl_transaction".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: CustomTextStyles
                                      .titleMediumBlueGray40018),
                              GestureDetector(
                                onTap: () {
                                  controller.transactionScreen();
                                },
                                child: Padding(
                                    padding: EdgeInsets.only(bottom: 4),
                                    child: Text("lbl_view_all".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: CustomTextStyles
                                            .bodyLarge18Blue500)),
                              )
                            ])),
                    Obx(
                      () => controller.listTransaction.isNotEmpty
                          ? Expanded(
                              child: ListView.builder(
                                itemCount: controller.listTransaction.length,
                                scrollDirection: Axis.vertical,
                                itemBuilder: (BuildContext context, int index) {
                                  // TransactionModel model =
                                  //     controller.listTransactionObj[index];
                                  // return TransactionItemWidget(model, index);
                                },
                              ),
                            )
                          : WalletTransactionEmpty(),
                    ),
                  ]))
        ],
      ),
    );
  }
}
