import 'package:tdc_mobile/core/app_export.dart';

class ServiceModel {
  final int id;
  final String serviceName;
  final double cost;
  final String imageUrl;
  final String description;
  final bool isActive;

  ServiceModel({
    required this.id,
    required this.serviceName,
    required this.cost,
    required this.imageUrl,
    required this.description,
    required this.isActive,
  });

  factory ServiceModel.fromJson(Map<String, dynamic> json) {

    return ServiceModel(
      id: json['serviceCemeteryID'],
      serviceName: json['serviceName'],
      cost: json['cost'],
      description: json["description"] ?? "",
      imageUrl: json["imageUrl"] ?? ImageConstant.imgNotFound,
      isActive: json["isActive"],
    );
  }

  static List<ServiceModel> listFromJson(list) =>
      List<ServiceModel>.from(list.map((x) => ServiceModel.fromJson(x)));
}
