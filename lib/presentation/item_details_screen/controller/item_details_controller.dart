import 'dart:convert';

import 'package:tdc_mobile/core/app_export.dart';
import 'package:tdc_mobile/data/apiClient/api_client.dart';
import 'package:tdc_mobile/data/model/service_model.dart';
import 'package:tdc_mobile/data/model/tribute_model.dart';
import 'package:tdc_mobile/presentation/services_screen/controller/services_controller.dart';
import 'package:tdc_mobile/presentation/services_screen/models/item_model.dart';

import '../../user_screen/controller/user_controller.dart';

class ItemDetailsController extends GetxController {
  Rx<ItemModel> itemDetails = ItemModel.empty().obs;
  final ApiClient _apiClient = Get.find();

  //  Rx<ItemDetailsModel> itemDetails = ItemDetailsModel.empty().obs;

  @override
  Future<void> onReady() async {
    ItemModel itemModel = Get.arguments;
    await getItemDetails(itemModel);
  }

  void getBack() {
    Get.back();
  }

  getItemDetails(ItemModel itemModel) {
    try {
      if (!itemModel.isService) {
        _apiClient.getTributeByID(itemModel.id).then((result) {
          if (result.statusCode == 200) {
            final jsonResult = jsonDecode(utf8.decode(result.bodyBytes));
            TributeModel tributeModel = TributeModel.fromJson(jsonResult);

            itemDetails.value = ItemModel.convertFromTribute(tributeModel);
            print("tribute: $jsonResult");
          } else if (result.statusCode == 403) {
            UserController userController = Get.find();
            userController.logout();
          } else {
            print('ItemDetails controller tribute: ${result.statusCode}');
          }
        });
      } else {
        _apiClient.getServiceByID(itemModel.id).then((result) {
          if (result.statusCode == 200) {
            final jsonResult = jsonDecode(utf8.decode(result.bodyBytes));
            ServiceModel serviceModel = ServiceModel.fromJson(jsonResult);

            itemDetails.value = ItemModel.convertFromService(serviceModel);
            print("service: $jsonResult");
          } else if (result.statusCode == 403) {
            UserController userController = Get.find();
            userController.logout();
          } else {
            print('ItemDetails controller Services: ${result.statusCode}');
          }
        });
      }
    } catch (error) {
      Logger.log(error.toString());
    }
  }

  void addToCart() {
    ServicesController servicesController = Get.find();
    servicesController.addToCart(itemDetails.value);
  }
}
