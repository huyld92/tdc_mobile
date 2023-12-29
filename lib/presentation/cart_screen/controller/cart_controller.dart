import 'package:flutter/material.dart';
import 'package:tdc_mobile/core/app_export.dart';
import 'package:tdc_mobile/data/model/cart_model.dart';
import 'package:tdc_mobile/presentation/services_screen/models/item_model.dart';
import 'package:tdc_mobile/widgets/custom_elevated_button.dart';

class CartController extends GetxController {
  late Rx<CartModel> cartModel;

  // RxList.generate(
  //   8,
  //   (index) => CartModel(
  //     id: 1,
  //     imgUrl: ImageConstant.imgAvatar,
  //     name: "Tribute name",
  //     price: "10000.0",
  //     quantity: 1,
  //     unit: "Cái",
  //   ),
  // );
  @override
  void onInit() {
    cartModel = Rx<CartModel>(PrefUtils.getCart()!);

    super.onInit();
  }

  void getBack() {
    Get.back();
  }

  Future<void> removeItemFromCart(ItemModel model) async {
    // Show a confirmation dialog
    bool? confirmed = await Get.dialog<bool>(
      AlertDialog(
        title: Text(
          'Confirm Removal',
          style: CustomTextStyles.headlineLarge20BlueGray700,
        ),
        content: Text(
          'Are you sure you want to remove this item from the cart?',
          style: theme.textTheme.bodyLarge,
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomElevatedButton(
                width: 120.h,
                onPressed: () => Get.back(result: false),
                text: 'Cancel',
                buttonStyle: CustomButtonStyles.outlineBlue200,
                // child: Text('Cancel',style: ,),
              ),
              CustomElevatedButton(
                width: 120.h,
                onPressed: () => Get.back(result: true),
                buttonStyle: CustomButtonStyles.outlineBlue200,
                text: 'Remove',
              ),
            ],
          ),
        ],
      ),
    );

    // If the user confirmed, proceed with removal
    if (confirmed == true) {
      // Find the index of the item in the cart
      int index = cartModel.value.listItemModel.indexWhere(
        (item) => item.id == model.id && item.isService == model.isService,
      );

      if (index > -1) {
        // If the item is found, remove it from the cart
        int quantity = cartModel.value.listItemModel[index].quantity;
        double price = double.parse(cartModel.value.listItemModel[index].price);

        cartModel.value.totalQuantity--;
        cartModel.value.totalAmount -= quantity * price;
        cartModel.value.listItemModel.removeAt(index);
        updateCart();
      }
    }
  }

  void subQuantity(int index) {
    ItemModel model = cartModel.value.listItemModel[index];

    // Find the item in the cart
    var existingItem = cartModel.value.listItemModel.firstWhereOrNull(
      (item) => item.id == model.id && item.isService == model.isService,
    );

    if (existingItem != null) {
      // If the item is found, decrease its quantity
      if (existingItem.quantity > 1) {
        existingItem.quantity--;
        cartModel.value.totalAmount -= double.parse(existingItem.price);
        cartModel.value.totalQuantity--;

      } else {
        // If the quantity is already 1, you may want to remove the item from the cart
        removeItemFromCart(model);
      }
      print('total: ${cartModel.value.totalQuantity}');
      updateCart();
    }
  }

  void addQuantity(int index) {
    ItemModel model = cartModel.value.listItemModel[index];
    // Find the item in the cart
    var existingItem = cartModel.value.listItemModel.firstWhereOrNull(
      (item) => item.id == model.id && item.isService == model.isService,
    );

    if (existingItem != null) {
      // If the item is found, increase its quantity
      existingItem.quantity++;
      cartModel.value.totalQuantity++;
      cartModel.value.totalAmount += double.parse(existingItem.price);
      updateCart();
    }
  }

  void updateCart() {
    // Update the cartModel in shared preferences
    PrefUtils.saveCart(cartModel.value);
    // Trigger a refresh of the UI
    cartModel.refresh();
  }

  Future<void> removeAllCart() async {
    bool? confirmed = await Get.dialog<bool>(
      AlertDialog(
        title: Text(
          'Confirm Removal',
          style: CustomTextStyles.headlineLarge20BlueGray700,
        ),
        content: Text(
          'Are you sure you want to remove all item in cart?',
          style: theme.textTheme.bodyLarge,
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomElevatedButton(
                width: 120.h,
                onPressed: () => Get.back(result: false),
                text: 'Cancel',
                buttonStyle: CustomButtonStyles.outlineBlue200,
                // child: Text('Cancel',style: ,),
              ),
              CustomElevatedButton(
                width: 120.h,
                onPressed: () => Get.back(result: true),
                buttonStyle: CustomButtonStyles.outlineBlue200,
                text: 'Remove',
              ),
            ],
          ),
        ],
      ),
    );
    if (confirmed == true) {
      // Find the index of the item in the cart
      cartModel.value.removeAllItem();
      updateCart();
      print('lengthCart: ${cartModel.value.listItemModel.length}');
    }
  }
}
