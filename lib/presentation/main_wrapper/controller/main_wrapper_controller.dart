import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tdc_mobile/presentation/forgot_password_screen/forgot_password.dart';
import 'package:tdc_mobile/presentation/home_screen/home_screen.dart';
import 'package:tdc_mobile/presentation/search_screen/search_screen.dart';
import 'package:tdc_mobile/presentation/services_screen/services_screen.dart';
import 'package:tdc_mobile/presentation/user_screen/user_screen.dart';

class MainWrapperController extends GetxController {
  late PageController pageController;

  RxInt currentPage = 0.obs;
  RxBool isDarkTheme = false.obs;

  List<Widget> pages = [
    const HomeScreen(),
    const SearchScreen(),
    const ServicesScreen(),
    const UserScreen()
  ];

  void goToTab(int page) {
    currentPage.value = page;
    pageController.jumpToPage(page);
  }

  void animateToTab(int page) {
    currentPage.value = page;
    pageController.animateToPage(page,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  @override
  void onInit() {
    pageController = PageController(initialPage: 0);
    super.onInit();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
