import 'package:get/get.dart';
import 'package:tdc_mobile/data/model/plot_model.dart';

class PlotController extends GetxController {
  final RxList<PlotModel> plots = <PlotModel>[].obs;
  RxString sectionName = "k2".obs;
  var indexGerbong = 0.obs;

  @override
  void onInit() {
    plots.addAll([
      PlotModel(plotID: 1, plotName: "1",isOccupied: true),
      PlotModel(plotID: 2, plotName: "2",isOccupied: false),
      PlotModel(plotID: 3, plotName: "3"),
      PlotModel(plotID: 4, plotName: "4"),
    ]);
    super.onInit();
  }

  void toggleSelection(PlotModel plot) {
    plot.isOccupied = !plot.isOccupied;

    plots.refresh();
  }
}
