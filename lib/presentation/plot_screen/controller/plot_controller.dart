import 'package:get/get.dart';
import 'package:tdc_mobile/core/app_export.dart';
import 'package:tdc_mobile/data/model/plot_model.dart';

class PlotController extends GetxController {
  final RxList<PlotModel> plots = <PlotModel>[].obs;
  RxString sectionName = ''.obs;

  @override
  void onInit() {
    sectionName.value = Get.arguments;

    plots.addAll([
      PlotModel(
        plotID: 1,
        plotName: 'Plot 1',
        longitude: 12.345,
        latitude: 67.890,
        price: 100000.0,
        size: 500.0,
        sectionID: 1,
        accountID: 1,
        availability: "Vacant",
        isActive: true,
      ),
      PlotModel(
        plotID: 2,
        plotName: 'Plot 2',
        longitude: 23.456,
        latitude: 78.901,
        price: 150000.0,
        size: 600.0,
        sectionID: 1,
        accountID: 2,
        availability: "Occupied",
        isActive: false,
      ),
      PlotModel(
        plotID: 3,
        plotName: 'Plot 3',
        longitude: 23.456,
        latitude: 78.901,
        price: 150000.0,
        size: 600.0,
        sectionID: 1,
        accountID: 2,
        availability: "Reserved",
        isActive: false,
      ),
    ]);
    super.onInit();
  }

  void toggleSelection(PlotModel plot) {
    plot.isActive = !plot.isActive;

    plots.refresh();
  }

  void getBack() {
    Get.back();
  }

  void toRegisterPlotScreen() {
    Get.toNamed(AppRoutes.registerPlotScreen);
  }
}
