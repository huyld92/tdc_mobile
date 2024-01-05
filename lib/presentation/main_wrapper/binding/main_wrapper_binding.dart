import 'package:get/get.dart';
 import 'package:tdc_mobile/presentation/home_screen/controller/home_controller.dart';
import 'package:tdc_mobile/presentation/main_wrapper/controller/main_wrapper_controller.dart';
import 'package:tdc_mobile/presentation/search_screen/controller/search_controller.dart';
import 'package:tdc_mobile/presentation/services_screen/controller/services_controller.dart';
import 'package:tdc_mobile/presentation/user_screen/controller/user_controller.dart';

class MainWrapperBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainWrapperController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => SearchController());
    Get.lazyPut(() => ServicesController());
    Get.lazyPut(() => UserController());
  }
}
