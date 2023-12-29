class PlotModel {
  final int plotID;
  final String plotName;
  bool isOccupied;

  PlotModel({
    required this.plotID,
    required this.plotName,
    this.isOccupied = false,
  });
}
