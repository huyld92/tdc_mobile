import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:scroll_datetime_picker/scroll_datetime_picker.dart';
import 'package:tdc_mobile/presentation/search_screen/controller/search_controller.dart'
    as search_controller;
import 'package:tdc_mobile/core/app_export.dart';
import 'package:tdc_mobile/widgets/app_bar/appbar_title_searchview.dart';
import 'package:tdc_mobile/widgets/app_bar/custom_app_bar.dart';
import 'package:tdc_mobile/widgets/custom_elevated_button.dart';
import 'package:tdc_mobile/widgets/custom_text_form_field.dart';

import '../../widgets/app_bar/appbar_trailing_iconbutton.dart';

class SearchScreen extends GetWidget<search_controller.SearchController> {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();

          print('aa');
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: mediaQueryData.size.width,
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    CustomTextFormField(
                      controller: controller.searchController,
                      autofocus: false,
                      hintText: "lbl_full_name".tr,
                      fillColor: appTheme.gray500,

                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // CustomTextFormField(
                        //   controller: controller.yearBornController,
                        //   autofocus: false,
                        //   width: mediaQueryData.size.width / 2.2,
                        //   hintText: "lbl_year_born".tr,
                        // ),
                        Text("${"lbl_year_born".tr}: ",
                            style: CustomTextStyles.titleMediumBlueGray40018),

                        Obx(
                          () => CustomElevatedButton(
                            height: 40.v,
                            width: 80.h,
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            buttonStyle: CustomButtonStyles.outlineBlue200,
                            text: controller.yearBorn.value,
                            onPressed: () {
                              Get.bottomSheet(Container(
                                color: appTheme.gray200,
                                height: mediaQueryData.size.height / 3,
                                child: ScrollDateTimePicker(
                                    itemExtent: 54,
                                    infiniteScroll: true,
                                    dateOption: DateTimePickerOption(
                                      dateFormat: DateFormat('yyyy'),
                                      minDate: DateTime(1900),
                                      maxDate:
                                          DateTime(DateTime.now().year + 1),
                                      initialDate: DateTime.now(),
                                    ),
                                    style: DateTimePickerStyle(
                                      // centerDecoration: BoxDecoration(
                                      //   color: appTheme.blue,
                                      //   borderRadius: BorderRadius.circular(30),
                                      //   border: Border.all(width: 3),
                                      // ),
                                      activeStyle: TextStyle(
                                        fontSize: 24,
                                        letterSpacing: -0.5,
                                        color: appTheme.black900,
                                      ),
                                      inactiveStyle: TextStyle(
                                        fontSize: 20,
                                        color:
                                            appTheme.gray500.withOpacity(0.7),
                                      ),
                                      disabledStyle: TextStyle(
                                        fontSize: 20,
                                        color: appTheme.red700,
                                      ),
                                    ),
                                    onChange: (datetime) {
                                      controller.yearBorn.value =
                                          datetime.format("yyyy");
                                    }),
                              ));
                            },
                          ),
                        ),
                        Text("${"lbl_year_died".tr}: ",
                            style: CustomTextStyles.titleMediumBlueGray40018),
                        Obx(
                          () => CustomElevatedButton(
                            height: 40.v,
                            width: 80.h,
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            buttonStyle: CustomButtonStyles.outlineBlue200,
                            text: controller.yearDied.value,
                            onPressed: () {
                              Get.bottomSheet(Container(
                                color: appTheme.gray200,
                                height: mediaQueryData.size.height / 3,
                                child: ScrollDateTimePicker(
                                    itemExtent: 54,
                                    infiniteScroll: true,
                                    dateOption: DateTimePickerOption(
                                      dateFormat: DateFormat('yyyy'),
                                      minDate: DateTime(1900),
                                      maxDate:
                                          DateTime(DateTime.now().year + 1),
                                      initialDate: DateTime.now(),
                                    ),
                                    style: DateTimePickerStyle(
                                      // centerDecoration: BoxDecoration(
                                      //   color: appTheme.blue,
                                      //   borderRadius: BorderRadius.circular(30),
                                      //   border: Border.all(width: 3),
                                      // ),
                                      activeStyle: TextStyle(
                                        fontSize: 24,
                                        letterSpacing: -0.5,
                                        color: appTheme.black900,
                                      ),
                                      inactiveStyle: TextStyle(
                                        fontSize: 20,
                                        color:
                                            appTheme.gray500.withOpacity(0.7),
                                      ),
                                      disabledStyle: TextStyle(
                                        fontSize: 20,
                                        color: appTheme.red700,
                                      ),
                                    ),
                                    onChange: (datetime) {
                                      controller.yearDied.value =
                                          datetime.format("yyyy");
                                    }),
                              ));
                            },
                          ),
                        ),
                      ],
                    ),
                    CustomElevatedButton(
                      height: 40.v,
                      text: "lbl_search".tr,
                      buttonStyle: CustomButtonStyles.outlineBlue200,
                      onPressed: () {
                        controller.searchGrave();
                      },
                    ),
                  ],
                ),
              ),
              Container(
                height: 40.v,
                width: mediaQueryData.size.height,
                color: appTheme.blueA100,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                alignment: Alignment.centerLeft,
                child: Obx(
                  () => Text(
                    "${controller.graves.length} ${"lbl_people_found".tr}",
                    style: CustomTextStyles.titleSmallWhite,
                  ),
                ),
              ),
              Expanded(
                child: Obx(
                  () => ListView.builder(
                    itemCount: controller.graves.length,
                    // Replace with the actual length of your data list
                    itemBuilder: (BuildContext context, int index) {
                      // Replace 'yourDataList[index]' with the actual item from your data list
                      var item = controller.graves[index];

                      return GestureDetector(
                        onTap: () {
                          // Handle tap event, e.g., navigate to details screen
                          controller.toGraveDetailsScreen();
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          color: theme.primaryColor,
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(item.deceased.fullName,
                                  style: CustomTextStyles.titleLarge16Gray900),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                      "${"lbl_year_born".tr}: ${item.deceased.dateOfBirth.format("dd/MM/yyy")}",
                                      style:
                                          CustomTextStyles.titleLarge16Gray900),
                                  Text(
                                      "${"lbl_year_died".tr}: ${item.deceased.dateOfDead.format("dd/MM/yyy")}",
                                      style:
                                          CustomTextStyles.titleLarge16Gray900),
                                ],
                              ),
                              Text(
                                  "${"lbl_location".tr}: ${item.sectionName}, ${item.plotName}",
                                  style: CustomTextStyles.titleLarge16Gray900),
                              Divider(height: 1, color: appTheme.gray300),
                              // Add a horizontal divider
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
