import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tdc_mobile/core/app_export.dart';
import 'package:tdc_mobile/data/apiClient/api_client.dart';
import 'package:tdc_mobile/data/model/cart_model.dart';
import 'package:tdc_mobile/data/model/service_model.dart';
import 'package:tdc_mobile/data/model/tribute_model.dart';
import 'package:tdc_mobile/presentation/services_screen/models/item_model.dart';
import 'package:tdc_mobile/presentation/user_screen/controller/user_controller.dart';

class ServicesController extends GetxController
    with GetSingleTickerProviderStateMixin {
  TextEditingController searchController = TextEditingController();
  final ApiClient apiClient = Get.find();

  late TabController tabviewController =
      Get.put(TabController(vsync: this, length: 2));

  late Rx<CartModel> cartModel;

  RxList<ItemModel> tributeList = RxList.empty();
  RxList<ItemModel> serviceList = RxList.empty();
  RxBool isItemLoading = false.obs;

  @override
  void onReady() {
    cartModel = (PrefUtils.getCart()!.obs);

    getServiceList();
    getTributeList();
  }

  @override
  void onClose() {
    super.onClose();
    searchController.dispose();
  }

  void toItemDetails(ItemModel item) {
    Get.toNamed(AppRoutes.itemDetailScreen, arguments: item)!.then((value) {
      cartModel.value = (PrefUtils.getCart()!);
    });
  }

  void toCartScreen() {
    Get.toNamed(AppRoutes.shoppingCartScreen)!.then((value) {
      cartModel.value = (PrefUtils.getCart()!);
    });
  }

  void addToCart(ItemModel itemModel) {
    cartModel.value.addToCart(itemModel);
    PrefUtils.saveCart(cartModel.value);
    Get.snackbar(
      'lbl_add_to_cart'.tr,
      "${"lbl_add".tr}${itemModel.name}${"lbl_to_cart_successful".tr}",
      colorText: appTheme.gray900,
      duration: const Duration(seconds: 2),
      backgroundColor: appTheme.white,
      icon: CustomImageView(
          width: 16.adaptSize,
          height: 16.adaptSize,
          imagePath: ImageConstant.imgNotify),
    );
  }

  Future<void> getTributeList() async {
    try {
      await apiClient.getTributeList().then((result) {
        if (result.statusCode == 200) {
          final jsonResult = jsonDecode(utf8.decode(result.bodyBytes));
          List<TributeModel> tributes = TributeModel.listFromJson(jsonResult);
          tributeList.addAll(ItemModel.fromListTribute(tributes));
          tributeList.refresh();
        } else if (result.statusCode == 403) {
          UserController userController = Get.find();
          userController.logout();
        } else if (result.statusCode == 500) {
          print('error 500');
        } else {
          Logger.log("Status code: ${result.statusCode}}");
        }
      });
    } catch (error) {
      Logger.log(error.toString());
    }
  }

  Future<void> getServiceList() async {
    try {
      await apiClient.getServiceList().then((result) {
        if (result.statusCode == 200) {
          final jsonResult = jsonDecode(utf8.decode(result.bodyBytes));

          List<ServiceModel> services = ServiceModel.listFromJson(jsonResult);
          serviceList.addAll(ItemModel.fromListService(services));
          serviceList.refresh();
        } else if (result.statusCode == 403) {
          UserController userController = Get.find();
          userController.logout();
        } else if (result.statusCode == 500) {
          print('error 500');
        } else {
          Logger.log("Status code: ${result.statusCode}}");
        }
      });
    } catch (error) {
      Logger.log(error.toString());
    }
  }
}
