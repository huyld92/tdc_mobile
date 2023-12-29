import 'package:flutter/material.dart';
import 'package:tdc_mobile/core/app_export.dart';
import 'package:tdc_mobile/core/enums/enum_bottom_bar.dart';
import 'package:tdc_mobile/presentation/main_wrapper/controller/main_wrapper_controller.dart';
import 'package:tdc_mobile/presentation/search_screen/search_screen.dart';
import 'package:tdc_mobile/presentation/services_screen/services_screen.dart';
import 'package:tdc_mobile/presentation/user_screen/user_screen.dart';
import 'package:tdc_mobile/widgets/custom_bottom_bar.dart';

class MainWrapper extends GetWidget<MainWrapperController> {
  const MainWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller.pageController,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: controller.animateToTab,
        children: [...controller.pages],
      ),
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  /// Section Widget
  Widget _buildBottomBar() {
    return CustomBottomBar(onChanged: (EBottomBar type) {
      controller.goToTab(getCurrentRoute(type));
     });
  }

  ///Handling route based on bottom click actions
  int getCurrentRoute(EBottomBar type) {
    switch (type) {
      case EBottomBar.Home:
        return 0;
      case EBottomBar.Search:
        return 1;
      case EBottomBar.Services:
        return 2;
      case EBottomBar.User:
        return 3;
      default:
        return -1;
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.searchScreen:
        return SearchScreen();
      case AppRoutes.servicesScreen:
        return ServicesScreen();
      case AppRoutes.userScreen:
        return UserScreen();
      default:
        return DefaultWidget();
    }
  }
}
