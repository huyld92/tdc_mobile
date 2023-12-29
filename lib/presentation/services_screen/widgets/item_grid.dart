
import 'package:flutter/cupertino.dart';
import 'package:tdc_mobile/presentation/services_screen/models/item_model.dart';
import 'package:tdc_mobile/presentation/services_screen/widgets/item_card.dart';

class ItemGrid extends StatelessWidget {
  final List<ItemModel> items;
  const ItemGrid({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 2/3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10
      ),
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(10),
      itemCount: items.length,
      itemBuilder: (context, index) => ItemCard(item: items[index], index: index,),
    );
  }
}