import 'package:flutter/material.dart';
import 'package:tdc_mobile/core/app_export.dart';
import 'package:tdc_mobile/presentation/services_screen/controller/services_controller.dart';
import 'package:tdc_mobile/presentation/services_screen/widgets/item_grid.dart';
import 'package:tdc_mobile/presentation/services_screen/widgets/item_loading_grid.dart';

class ItemsPage extends GetWidget<ServicesController> {
  bool isServicesTab;

  ItemsPage(this.isServicesTab, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: Obx(() {
          if (controller.isItemLoading.value) {
            return const ItemLoadingGrid();
          } else {
            if (isServicesTab) {
              if (controller.serviceList.isNotEmpty) {
                return ItemGrid(items: controller.serviceList);
              } else {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomImageView(
                      height: 64.adaptSize,
                      width: 64.adaptSize,
                      imagePath: ImageConstant.imgItemNotFound,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                          isServicesTab
                              ? 'msg_service_not_found'.tr
                              : "msg_tribute_not_found".tr,
                          overflow: TextOverflow.ellipsis,
                          style: CustomTextStyles.titleMediumBlue50018),
                    )
                  ],
                );
              }
            } else {
              if (controller.tributeList.isNotEmpty) {
                return ItemGrid(items: controller.tributeList);
              } else {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomImageView(
                      height: 64.adaptSize,
                      width: 64.adaptSize,
                      imagePath: ImageConstant.imgItemNotFound,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text("msg_tribute_not_found".tr,
                          overflow: TextOverflow.ellipsis,
                          style: CustomTextStyles.titleMediumBlue50018),
                    )
                  ],
                );
              }
            }
          }
        }))
      ],
    );
  }
}
