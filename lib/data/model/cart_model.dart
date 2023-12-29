import 'package:tdc_mobile/core/app_export.dart';

import '../../presentation/services_screen/models/item_model.dart';

class CartModel {
  int totalQuantity;
  double totalAmount;
  String phoneNumber;

  // List<ItemModel> listItemModel = List.empty();
  List<ItemModel> listItemModel;

  CartModel(
      {required this.totalQuantity,
      required this.totalAmount,
      required this.phoneNumber,
      required this.listItemModel});

  Map<String, dynamic> toJson() {
    return {
      'totalQuantity': totalQuantity,
      'totalAmount': totalAmount,
      'phoneNumber': phoneNumber,
      'listItemModel': listItemModel.map((item) => item.toJson()).toList(),
    };
  }

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      totalQuantity: json['totalQuantity'],
      totalAmount: json['totalAmount'],
      phoneNumber: json['phoneNumber'],
      listItemModel: List<ItemModel>.from(json['listItemModel']
          .map((itemJson) => ItemModel.fromJson(itemJson))),
    );
  }

  void addToCart(ItemModel itemModel) {
    // Check if the item is already in the cart
    int index = listItemModel.indexWhere(
      (item) =>
          item.id == itemModel.id && item.isService == itemModel.isService,
    );

    if (index >= 0) {
      // Item is already in the cart, update its quantity
      listItemModel[index].quantity += 1;
      // Item is not in
    } else {
      itemModel.quantity = 1;
      listItemModel.add(itemModel);
    }
    totalAmount += double.parse(itemModel.price);
    totalQuantity++;

    // totalAmount+ =
  }

  void removeAllItem() {
    totalQuantity = 0;
    totalAmount = 0.0;
    listItemModel = List.empty();
  }
}
