import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_maps/maps.dart';
import 'package:tdc_mobile/core/app_export.dart';
import 'package:tdc_mobile/widgets/app_bar/appbar_title.dart';
import 'package:tdc_mobile/widgets/app_bar/custom_app_bar.dart';

import 'controller/map_controller.dart';

class MapScreen extends GetWidget<MapController> {
  const MapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      appBar: _buildAppBar(),
      body: SizedBox(
         height: mediaQueryData.size.height,
        child: SfMaps(
          layers: <MapShapeLayer>[
            MapShapeLayer(
              source: controller.mapSource,
              onSelectionChanged: (index) {
                controller.viewPlots(index);
              },
              showDataLabels: true,
              tooltipSettings: MapTooltipSettings(
                  color: Colors.grey[300],
                  strokeColor: Colors.white,
                  strokeWidth: 2),
              strokeColor: Colors.white,
              strokeWidth: 0.5,
              dataLabelSettings: MapDataLabelSettings(
                textStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize:
                        Theme.of(context).textTheme.bodySmall!.fontSize),
              ),
            ),
          ],
        ),
      ),
    );
  }
  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
      height: 54.v,
      leadingWidth: 40,
      leading: CustomImageView(
          imagePath: ImageConstant.imgBack,
          height: 24.adaptSize,
          width: 24.adaptSize,
          margin: const EdgeInsets.only(left: 16, top: 13, bottom: 17),
          onTap: () {
            controller.getBack();
          }),
      centerTitle: false,
      title: AppbarTitle(
        text: 'lbl_cemetery_map'.tr,
        margin: EdgeInsets.only(left: 20),
      ),
    );
  }
}
