import 'package:get/get.dart';
import 'package:tdc_mobile/presentation/grave_details_screen/controller/grave_details_controller.dart';

class GraveDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GraveDetailsController());
  }
}
