import 'package:get/get.dart';
import 'package:tdc_mobile/presentation/plot_screen/controller/plot_controller.dart';

class PLotBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PlotController());
  }
}
