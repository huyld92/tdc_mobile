import 'package:flutter/material.dart';
import 'package:tdc_mobile/core/app_export.dart';
import 'package:tdc_mobile/presentation/search_screen/models/search_grave_model.dart';

import '../../../data/model/deceased_model.dart';
import '../../../data/model/grave_model.dart';

class SearchController extends GetxController {
  TextEditingController searchController = TextEditingController();
 RxString yearBorn = "lbl_year_born".tr.obs;
 RxString yearDied = "lbl_year_died".tr.obs;

  RxList<SearchGraveModel> graves = RxList.generate(
      10,
      (index) => SearchGraveModel(
          graveID: 1,
          deceased: DeceasedModel(
                        deceasedID: 1,
                        fullName: "fullName",
                        dateOfDead: DateTime.now(),
                        dateOfBirth: DateTime.now(),
                        gender: "gender",
                        isActive: true),
          sectionName: "section K1",
          plotName: "plot 1"));

  // RxList<GraveModel> graves = RxList.generate(
  //     10,
  //     (index) => GraveModel(
  //         graveID: 1,
  //         sizeOfGrave: "176 x 147 cm",
  //         imageUrl: ImageConstant.imgAvatar,
  //         graveType: "Double Grave",
  //         plot: 1,
  //         deceased: DeceasedModel(
  //             deceasedID: 1,
  //             fullName: "fullName",
  //             dateOfDead: DateTime.now(),
  //             dateOfBirth: DateTime.now(),
  //             gender: "gender",
  //             isActive: true),
  //         isActive: true));

  @override
  void onReady() {}

  void toGraveDetailsScreen() {
    FocusManager.instance.primaryFocus!.unfocus();

    Get.toNamed(AppRoutes.graveDetailsScreen);
  }

  void searchGrave() {
    print('searc');
  }
}
