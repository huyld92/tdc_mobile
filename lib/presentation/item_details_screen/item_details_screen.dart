import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tdc_mobile/widgets/custom_elevated_button.dart';

import 'controller/item_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:tdc_mobile/core/app_export.dart';

class ItemDetailsScreen extends GetWidget<ItemDetailsController> {
  const ItemDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(children: [
              Hero(
                tag: "e",
                child: Obx(
                  () => CachedNetworkImage(
                    imageUrl: controller.itemDetails.value.imageUrl,
                    height: 300.adaptSize,
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                          color: ColorConstant.white,
                          image: DecorationImage(image: imageProvider)),
                    ),
                    placeholder: (context, url) => Shimmer.fromColors(
                      highlightColor: Colors.white,
                      baseColor: Colors.grey.shade300,
                      child: Container(
                        color: Colors.grey.shade300,
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
              Positioned(
                  child: CustomImageView(
                margin: EdgeInsets.all(20),
                height: 30.adaptSize,
                imagePath: ImageConstant.imgBack,
                onTap: () {
                  controller.getBack();
                },
              )),
            ]),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(controller.itemDetails.value.name,
                  style: CustomTextStyles.titleMediumBlueGray40024),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Obx(
                () => Text('\$${controller.itemDetails.value.price}',
                    style: CustomTextStyles.bodyMediumBlueGray40018),
              ),
            ),
            const SizedBox(height: 20),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 10),
            //   child: Row(
            //     children: [
            //       Container(
            //         decoration: BoxDecoration(
            //             border: Border.all(width: 1),
            //             borderRadius:
            //                 const BorderRadius.all(Radius.circular(8))),
            //         child: Row(
            //           children: [
            //             InkWell(
            //               onTap: () {
            //                 // if (_qty > 1) {
            //                 //   setState(() {
            //                 //     _qty--;
            //                 //   });
            //                 // }
            //               },
            //               child: Icon(
            //                 Icons.keyboard_arrow_left_sharp,
            //                 size: 32,
            //                 color: Colors.grey.shade800,
            //               ),
            //             ),
            //             Text(
            //               "2",
            //               // formatter.format(_qty),
            //               style: TextStyle(
            //                   fontSize: 18, color: Colors.grey.shade800),
            //             ),
            //             InkWell(
            //               onTap: () {
            //                 // setState(() {
            //                 //   _qty++;
            //                 // });
            //               },
            //               child: Icon(
            //                 Icons.keyboard_arrow_right_sharp,
            //                 size: 32,
            //                 color: Colors.grey.shade800,
            //               ),
            //             )
            //           ],
            //         ),
            //       ),
            //       const SizedBox(width: 10),
            //       Container(
            //         decoration: BoxDecoration(
            //             border: Border.all(width: 1),
            //             borderRadius:
            //                 const BorderRadius.all(Radius.circular(8))),
            //         child: Row(
            //           children: [
            //             InkWell(
            //               onTap: () {
            //                 // if (_tagIndex > 0) {
            //                 //   setState(() {
            //                 //     _tagIndex--;
            //                 //   });
            //                 // }
            //               },
            //               child: Icon(
            //                 Icons.keyboard_arrow_left_sharp,
            //                 size: 32,
            //                 color: Colors.grey.shade800,
            //               ),
            //             ),
            //             Text(
            //               "Đóa",
            //               // widget.product.tags[_tagIndex].title,
            //               style: TextStyle(
            //                   fontSize: 18, color: Colors.grey.shade800),
            //             ),
            //             InkWell(
            //               onTap: () {
            //                 // if (_tagIndex != (widget.product.tags.length - 1)) {
            //                 //   setState(() {
            //                 //     _tagIndex++;
            //                 //   });
            //                 // }
            //               },
            //               child: Icon(
            //                 Icons.keyboard_arrow_right_sharp,
            //                 size: 32,
            //                 color: Colors.grey.shade800,
            //               ),
            //             )
            //           ],
            //         ),
            //       )
            //     ],
            //   ),
            // ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text('About this product:',
                  style: CustomTextStyles.titleMediumBlue20018),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Obx(
                () => Text(
                  controller.itemDetails.value.description,
                  style: CustomTextStyles.titleMediumBlueGray20018,
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomElevatedButton(
            onPressed: () {
              controller.addToCart();
            },
            text: "Add to Cart",
            buttonStyle: CustomButtonStyles.outlinePrimary,
            buttonTextStyle: CustomTextStyles.titleMedium18,
          )),
    );
  }
}
