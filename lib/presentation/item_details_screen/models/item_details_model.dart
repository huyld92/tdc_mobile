class ItemDetailsModel {
  late int id;

  late String name;

  late String price;

  late String description;

  late String imageUrl;

  ItemDetailsModel.empty();

  ItemDetailsModel(
      {required this.id,
      required this.name,
      required this.price,
      required this.description,
      required this.imageUrl});
}
