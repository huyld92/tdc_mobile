import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:tdc_mobile/presentation/cart_screen/widgets/cart_item_widget.dart';
import 'package:tdc_mobile/presentation/cart_screen/widgets/empty_cart_widget.dart';
import 'package:tdc_mobile/presentation/services_screen/models/item_model.dart';
import 'package:tdc_mobile/widgets/app_bar/appbar_title.dart';
import 'package:tdc_mobile/widgets/app_bar/custom_app_bar.dart';
import 'package:tdc_mobile/widgets/custom_elevated_button.dart';

import 'controller/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:tdc_mobile/core/app_export.dart';

class CartScreen extends GetWidget<CartController> {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: theme.primaryColor,
      appBar: _buildAppBar(),
      body: Container(
        width: double.maxFinite,
        padding:
            const EdgeInsets.only(left: 16, top: 23, right: 16, bottom: 23),
        child: Obx(() {
          return controller.cartModel.value.totalQuantity > 0
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("lbl_your_order".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: CustomTextStyles.headlineSmall18),
                          InkWell(
                            onTap: () {
                              controller.removeAllCart();
                            },
                            child: Text("lbl_remove_cart".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: CustomTextStyles.headlineSmall18Red700),
                          ),
                        ]),
                    Container(
                      height: 550.v,
                      padding: const EdgeInsets.only(top: 19),
                      child: ListView.separated(
                        // physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        separatorBuilder: (context, index) {
                          return SizedBox(height: 16.v);
                        },
                        itemCount:
                            controller.cartModel.value.listItemModel.length,
                        itemBuilder: (context, index) {
                          return Slidable(
                            key: const ValueKey(1),
                            endActionPane: ActionPane(
                              // dismissible: DismissiblePane(onDismissed: () {
                              //   controller.removeItemFromCart(model);
                              // }),
                              motion: const ScrollMotion(),
                              children: [
                                SlidableAction(
                                  onPressed: (context) {
                                    controller.removeItemFromCart(controller
                                        .cartModel.value.listItemModel[index]);
                                    // Thực hiện hàm xóa trong controller
                                  },
                                  backgroundColor: appTheme.red400,
                                  foregroundColor: appTheme.white,
                                  icon: Icons.delete,
                                  label: 'Delete',
                                ),
                              ],
                            ),
                            child: CartItemWidget(index),
                          );
                        },
                      ),
                    ),
                    Container(
                        margin: const EdgeInsets.only(top: 19),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 7),
                        decoration: AppDecoration.fillBlue50.copyWith(
                            borderRadius: BorderRadiusStyle.roundedBorder6),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("lbl_grand_total".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: CustomTextStyles.titleLarge18Gray900),
                              Obx(
                                () => Text(
                                    controller.cartModel.value.totalAmount
                                        .toString(),
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: CustomTextStyles
                                        .headlineSmallBlueA70018),
                              )
                            ])),
                    CustomElevatedButton(
                        text: "lbl_checkout".tr,
                        height: 50.v,
                        margin: const EdgeInsets.only(bottom: 5, top: 5))
                  ],
                )
              : const EmptyCartWidget();
        }),
      ),
    ));
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
