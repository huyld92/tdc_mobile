import 'package:get/get.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:tdc_mobile/core/app_export.dart';
import 'package:tdc_mobile/data/model/deceased_model.dart';

import '../../../data/model/grave_model.dart';

Rx<int> sliderIndex = 0.obs;

class GraveDetailsController extends GetxController {
  Rx<GraveModel> graveDetailsModel = GraveModel(
          graveID: 1,
          sizeOfGrave: "176 x 147 cm",
          imageUrl: ImageConstant.imgAvatar,
          graveType: "Double Grave",
          plot: 1,
          deceased: DeceasedModel(
              deceasedID: 1,
              fullName: "fullName",
              dateOfDead: DateTime.now(),
              dateOfBirth: DateTime.now(),
              gender: "gender",
              isActive: true),
          isActive: true)
      .obs;
  Rx<int> sliderIndex = 0.obs;

  void getBack() {
    Get.back();
  }

  Future<void> viewOnMap() async {
    print('map: ${await MapLauncher.isMapAvailable(MapType.google)}');
    if (await MapLauncher.isMapAvailable(MapType.google) != null) {
      await MapLauncher.showMarker(
        mapType: MapType.google,
        coords: Coords(10.862038, 106.769921),
        title: "Mo",
        description: "sssss",
      );
    }
  }
}
