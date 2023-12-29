import 'package:get/get.dart';
import 'package:tdc_mobile/presentation/map_screen/controller/map_controller.dart';

class MapBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MapController());
  }
}
