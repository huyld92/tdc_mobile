import 'package:flutter/material.dart';
import 'package:tdc_mobile/core/app_export.dart';
import 'package:tdc_mobile/presentation/cart_screen/controller/cart_controller.dart';

import '../../services_screen/models/item_model.dart';

class CartItemWidget extends GetWidget<CartController> {
  int index;

  CartItemWidget(this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Card(
          clipBehavior: Clip.antiAlias,
          elevation: 0,
          margin: const EdgeInsets.all(0),
          color: theme.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusStyle.roundedBorder6,
          ),
          child: Container(
            // height: 64.v,
            // width: 64.h,
            padding:
                const EdgeInsets.only(left: 11, top: 18, right: 11, bottom: 18),
            decoration: AppDecoration.fillWhiteA700.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder6,
                color: Colors.amber),
            child: CustomImageView(
              imagePath:
                  controller.cartModel.value.listItemModel[index].imageUrl,
              height: 64.adaptSize,
              width: 64.adaptSize,
              alignment: Alignment.center,
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 260.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 6, bottom: 5),
                    child: Obx(
                      () => Text(
                        controller.cartModel.value.listItemModel[index].name,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: CustomTextStyles.titleLargeBlueGray40016,
                      ),
                    ),
                  ),
                  Container(
                    width: 106.h,
                    padding: const EdgeInsets.only(
                        left: 8, top: 4, right: 8, bottom: 4),
                    decoration: AppDecoration.outlineBlueA700.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder6,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: (88 / 3).h,
                          child: CustomImageView(
                              onTap: () {
                                controller.subQuantity(index);
                              },
                              imagePath: ImageConstant.imgSub,
                              height: 16.adaptSize,
                              width: 16.adaptSize,
                              margin: const EdgeInsets.symmetric(vertical: 3)),
                        ),
                        SizedBox(
                          width: (88 / 3).h,
                          child: Obx(
                            () => Text(
                              controller
                                  .cartModel.value.listItemModel[index].quantity
                                  .toString(),
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: CustomTextStyles.headlineSmall18,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: (88 / 3).h,
                          child: CustomImageView(
                            onTap: () {
                              print('plus');
                              controller.addQuantity(index);
                            },
                            imagePath: ImageConstant.imgPlus,
                            height: 16.adaptSize,
                            width: 16.adaptSize,
                            margin: const EdgeInsets.symmetric(vertical: 5),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 260.h,
              padding: const EdgeInsets.only(top: 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 3),
                    child: Text(
                      controller.cartModel.value.listItemModel[index].unit,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: theme.textTheme.bodyLarge,
                    ),
                  ),
                  Text(
                    controller.cartModel.value.listItemModel[index].price,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: CustomTextStyles.headlineSmallBlueGray70016,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
