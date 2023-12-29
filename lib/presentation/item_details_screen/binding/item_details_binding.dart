import '../controller/item_details_controller.dart';
import 'package:get/get.dart';

class ItemDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ItemDetailsController());
  }
}
