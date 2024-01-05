import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:tdc_mobile/core/app_export.dart';
import 'package:tdc_mobile/presentation/grave_details_screen/controller/grave_details_controller.dart';
import 'package:tdc_mobile/widgets/app_bar/appbar_title.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../widgets/app_bar/custom_app_bar.dart';

class GraveDetailsScreen extends GetWidget<GraveDetailsController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: _buildAppBar(),
      body: _buildGraveOverview(),
    ));
  }

  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
      leadingWidth: 40.h,
      leading: CustomImageView(
          imagePath: ImageConstant.imgBack,
          height: 24.adaptSize,
          width: 24.adaptSize,
          margin: const EdgeInsets.only(left: 16, top: 13, bottom: 17),
          onTap: () {
            controller.getBack();
          }),
      title: AppbarTitle(
          text: "lbl_grave".tr, margin: EdgeInsets.only(left: 12.h)),
    );
  }

  /// Section Widget
  Widget _buildGraveOverview() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Obx(() => CarouselSlider.builder(
          options: CarouselOptions(
              height: 238.v,
              initialPage: 0,
              autoPlay: true,
              viewportFraction: 1.0,
              enableInfiniteScroll: false,
              scrollDirection: Axis.horizontal,
              onPageChanged: (index, reason) {
                controller.sliderIndex.value = index;
              }),
          itemCount: controller.sliderIndex.value + 1,
          itemBuilder: (context, index, realIndex) {
            return CustomImageView(
              imagePath: ImageConstant.imgAvatar,
              height: 238.v,
              width: 375.h,
            );
          })),
      SizedBox(height: 16.v),
      Align(
          alignment: Alignment.center,
          child: Obx(() => SizedBox(
              height: 8.v,
              child: AnimatedSmoothIndicator(
                  activeIndex: controller.sliderIndex.value,
                  count: 1,
                  axisDirection: Axis.horizontal,
                  effect: ScrollingDotsEffect(
                      spacing: 8,
                      activeDotColor: theme.colorScheme.primary.withOpacity(1),
                      dotColor: appTheme.blue50,
                      dotHeight: 8.v,
                      dotWidth: 8.h))))),
      SizedBox(height: 15.v),
      Align(
          alignment: Alignment.center,
          child: Padding(
              padding: EdgeInsets.only(left: 16.h, right: 25.h),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        child: SizedBox(
                            width: 275.h,
                            child: Obx(
                              () => Text(
                                  controller.graveDetailsModel.value.deceased
                                      .fullName,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: CustomTextStyles.titleLarge16Gray900
                                      .copyWith(height: 1.50)),
                            ))),
                  ]))),
       Padding(
         padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
         child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Text("lbl_birth",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: CustomTextStyles.titleLarge16Gray900
                        .copyWith(height: 1.50)),
                Text(controller.graveDetailsModel.value.deceased.dateOfBirth.format("dd/MM-yyy"),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: CustomTextStyles.titleLarge16Gray900
                        .copyWith(height: 1.50)),
              ],
            ),
            Column(
              children: [
                Text("lbl_death",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: CustomTextStyles.titleLarge16Gray900
                        .copyWith(height: 1.50)),
                Text(controller.graveDetailsModel.value.deceased.dateOfDead.format("dd/MM-yyy"),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: CustomTextStyles.titleLarge16Gray900
                        .copyWith(height: 1.50)),
              ],
            )
          ],
               ),
       ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        child: Text("${"lbl_size_of_grave".tr}: ${controller.graveDetailsModel.value.sizeOfGrave}",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: CustomTextStyles.titleLarge16Gray900.copyWith(height: 1.50)),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        child: Text("${"lbl_grave_type".tr}: ${controller.graveDetailsModel.value.graveType}",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: CustomTextStyles.titleLarge16Gray900.copyWith(height: 1.50)),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        child: Text("${"lbl_gender".tr}: ${controller.graveDetailsModel.value.deceased.gender}",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: CustomTextStyles.titleLarge16Gray900.copyWith(height: 1.50)),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("lbl_location",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: CustomTextStyles.titleLarge16Gray900.copyWith(height: 1.50)),
            InkWell(
               onTap: () {
                 controller.viewOnMap();
               },
              child: Text("lbl_view_on_map".tr,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: CustomTextStyles.titleLarge16Blue500.copyWith(height: 1.50)),
            ),
          ],
        ),
      ),
    ]);
  }
}
