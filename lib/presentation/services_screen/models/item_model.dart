import 'package:tdc_mobile/data/model/service_model.dart';
import 'package:tdc_mobile/data/model/tribute_model.dart';

class ItemModel {
  int id;

  String name;

  String price;

  int quantity;

  String unit;

  String description;

  String imageUrl;

  bool isService;

  ItemModel(
      {required this.id,
      required this.name,
      required this.price,
      required this.quantity,
      required this.unit,
      required this.description,
      required this.imageUrl,
      required this.isService});

  factory ItemModel.convertFromTribute(TributeModel tributeModel) {
    return ItemModel(
      id: tributeModel.id,
      name: tributeModel.tributeName,
      price: tributeModel.price.toString(),
      quantity: 1,
      unit: tributeModel.unit,
      description: tributeModel.description,
      imageUrl: tributeModel.imageUrl,
      isService: false,
    );
  }

  factory ItemModel.convertFromService(ServiceModel service) {
    return ItemModel(
      id: service.id,
      name: service.serviceName,
      price: service.cost.toString(),
      quantity: 1,
      unit: "",
      description: service.description,
      imageUrl: service.imageUrl,
      isService: true,
    );
  }

  static List<ItemModel> fromListService(list) =>
      List<ItemModel>.from(list.map((x) => ItemModel.convertFromService(x)));

  static List<ItemModel> fromListTribute(list) =>
      List<ItemModel>.from(list.map((x) => ItemModel.convertFromTribute(x)));

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      quantity: json['quantity'],
      unit: json['unit'],
      description: json['description'],
      imageUrl: json['imageUrl'],
      isService: json['isService'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'quantity': quantity,
      'unit': unit,
      'description': description,
      'imageUrl': imageUrl,
      'isService': isService,
    };
  }

  @override
  String toString() {
    return 'ItemModel{id: $id, name: $name, price: $price, quantity: $quantity, unit: $unit, description: $description, imageUrl: $imageUrl, isService: $isService}';
  }

  factory ItemModel.empty() {
    return ItemModel(
        id: 1,
        name: "",
        price: "",
        quantity: 1,
        unit: "",
        description: "",
        imageUrl: "",
        isService: false);
  }
}
