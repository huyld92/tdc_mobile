import 'package:tdc_mobile/presentation/services_screen/widgets/items_page.dart';
import 'package:tdc_mobile/widgets/app_bar/appbar_title.dart';
import 'package:tdc_mobile/widgets/app_bar/appbar_title_searchview.dart';
import 'package:tdc_mobile/widgets/app_bar/appbar_trailing_iconbutton.dart';
import 'package:tdc_mobile/widgets/app_bar/custom_app_bar.dart';

import 'controller/services_controller.dart';
import 'package:flutter/material.dart';
import 'package:tdc_mobile/core/app_export.dart';

class ServicesScreen extends GetWidget<ServicesController> {
  const ServicesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: _buildAppBar(),
        body: ListView(
          children: [
            SizedBox(height: 10.v),
            _buildTabview(),
            SizedBox(
              height: 620.v,
              child: TabBarView(
                controller: controller.tabviewController,
                children: [
                  ItemsPage(true),
                  ItemsPage(false),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
      title: AppbarTitleSearchView(
        margin: EdgeInsets.only(left: 16.h,top: 10.v),
        hintText: "lbl_search".tr,
        controller: controller.searchController,
      ),
      actions: [
        AppbarTrailingIconButton(
          onTap: () {
            print('on cart');
            controller.toCartScreen();
          },
          imagePath: ImageConstant.imgCart,
          margin: EdgeInsets.fromLTRB(16.h, 5.v, 19.h, 5.v),
        ),
      ],
    );
  }

  Widget _buildTabview() {
    return SizedBox(
      height: 30.v,
      width: double.maxFinite,
      child: TabBar(
        controller: controller.tabviewController,
        isScrollable: false,
        labelColor: appTheme.blueA200,
        unselectedLabelColor: appTheme.blueGray200,
        indicatorColor: appTheme.blueA200,
        tabs: [
          Tab(
            child: SizedBox(
              width: double.maxFinite / 2,
              child: Center(
                child: Text(
                  "lbl_services".tr,
                ),
              ),
            ),
          ),
          Tab(
            child: SizedBox(
              width: double.maxFinite / 2,
              child: Center(
                child: Text(
                  "lbl_tributes".tr,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
