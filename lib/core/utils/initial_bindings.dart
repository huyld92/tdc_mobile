import 'package:tdc_mobile/core/app_export.dart';
import 'package:tdc_mobile/data/apiClient/api_client.dart';

import 'deeplink_controller.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(PrefUtils());
    Get.put(ApiClient());
    Connectivity connectivity = Connectivity();
    Get.put(NetworkInfo(connectivity));
    Get.put(DeepLinkController());

  }
}
