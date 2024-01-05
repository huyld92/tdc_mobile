class PlotModel {
  int? plotID;
  String plotName = '';
  double longitude = 0.0;
  double latitude = 0.0;
  double price = 0.0;
  double size = 0.0;
  int? sectionID;
  int? accountID;
  String availability = "Occupied";
  bool isActive = false;

  PlotModel({
    this.plotID,
    required this.plotName,
    required this.longitude,
    required this.latitude,
    required this.price,
    required this.size,
    this.sectionID,
    this.accountID,
    required this.availability,
    required this.isActive,
  });

  factory PlotModel.fromJson(Map<String, dynamic> json) {
    return PlotModel(
      plotID: json['plotID'],
      plotName: json['plot_name'] ?? '',
      longitude: json['longtitude'] ?? 0.0,
      latitude: json['latitude'] ?? 0.0,
      price: json['price'] ?? 0.0,
      size: json['size'] ?? 0.0,
      sectionID: json['sectionID'],
      accountID: json['accountID'],
      availability: json['availability'],
      isActive: json['is_active'] ?? false,
    );
  }

  static List<PlotModel> listFromJson(List<dynamic> list) =>
      List<PlotModel>.from(list.map((x) => PlotModel.fromJson(x)));
}
