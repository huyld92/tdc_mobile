import 'package:tdc_mobile/core/app_export.dart';

class HomeController extends GetxController {
  @override
  void onReady() {}

  void viewMap() {
    Get.toNamed(AppRoutes.mapScreen);
  }
}
