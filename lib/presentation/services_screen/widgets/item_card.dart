import 'dart:ffi';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tdc_mobile/core/app_export.dart';
import 'package:tdc_mobile/data/model/tribute_model.dart';
import 'package:tdc_mobile/presentation/services_screen/controller/services_controller.dart';
import 'package:tdc_mobile/presentation/services_screen/models/item_model.dart';

class ItemCard extends GetWidget<ServicesController> {
  final ItemModel item;
  final int index;

  const ItemCard({Key? key, required this.item, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
        controller.toItemDetails(item);
      },
      child: Material(
        elevation: 8,
        shadowColor: Colors.grey.shade300,
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                flex: 5,
                child: Center(
                  child: Hero(
                    // images items
                    // tag: tribute.images.first,
                    tag: item.imageUrl + index.toString(),
                    child: CachedNetworkImage(
                      imageUrl: item.imageUrl,
                      placeholder: (context, url) => Shimmer.fromColors(
                        highlightColor: Colors.white,
                        baseColor: Colors.grey.shade300,
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          color: Colors.amber,
                        ),
                      ),
                      errorWidget: (context, url, error) => const Center(
                        child: Icon(
                          Icons.error_outline,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Flexible(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                        item.name,
                        style: CustomTextStyles.titleMedium18Blue500,
                        maxLines: 1),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$${item.price}',
                          style: CustomTextStyles.bodyMediumBlueGray400,
                        ),
                        CustomImageView(
                          onTap: () {
                            controller.addToCart(item);
                          },
                          height: 30.adaptSize,
                          width: 30.adaptSize,
                          imagePath: ImageConstant.imgAddToCart,
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
