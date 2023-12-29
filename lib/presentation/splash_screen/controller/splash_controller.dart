import 'package:tdc_mobile/core/app_export.dart';

class SplashController extends GetxController {

  @override
  void onReady() {
    Future.delayed(const Duration(milliseconds: 3000), () {
      Get.toNamed(
        AppRoutes.loginScreen
      );
    });
  }
}
