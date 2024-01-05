import 'package:get/get.dart';
 import 'package:tdc_mobile/presentation/register_plot_screen/controller/register_plot_controller.dart';

class RegisterPlotBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterPlotController());
  }
}
