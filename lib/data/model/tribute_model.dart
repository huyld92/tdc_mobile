class TributeModel {
  final int id;
  final String tributeName;
  final double price;
  final int quantity;
  final String unit;
  final int tributeTypeId;
  final String description;
  final String imageUrl;
  final bool isActive;

  TributeModel({
    required this.id,
    required this.tributeName,
    required this.price,
    required this.quantity,
    required this.unit,
    required this.tributeTypeId,
    required this.description,
    required this.imageUrl,
    required this.isActive,
  });

  factory TributeModel.fromJson(Map<String, dynamic> json) {
    return TributeModel(
      id: json['tributeID'],
      tributeName: json["tributeName"] ?? "",
      price: json["price"] ?? 0.0,
      quantity: json['quantity'],
      unit: json["unit"] ?? "",
      tributeTypeId: json["tributeType"]["tributeTypeID"] ?? 0,
      description: json["description"] ?? "",
      imageUrl: json["image_url"] ?? "",
      isActive: json["isAtive"],
    );
  }

  static List<TributeModel> listFromJson(list) =>
      List<TributeModel>.from(list.map((x) => TributeModel.fromJson(x)));
}
