import 'package:tdc_mobile/data/model/plot_model.dart';

class SectionModel {
  int sectionID;
  String sectionName;
  int numberOfPlot;
  bool isColumbarium;
  int cemeteryID;
  final List<PlotModel> plots;

  SectionModel({
    required this.sectionID,
    required this.sectionName,
    required this.numberOfPlot,
    required this.isColumbarium,
    required this.cemeteryID,
    required this.plots,
  });
}
