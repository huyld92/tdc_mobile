import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_maps/maps.dart';
import 'package:tdc_mobile/core/app_export.dart';

import 'controller/map_controller.dart';

class MapScreen extends GetWidget<MapController> {
  const MapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      body: SizedBox(
        height: mediaQueryData.size.height,
        child: Center(
          child: SfMaps(
            layers: <MapShapeLayer>[
              MapShapeLayer(
                source: controller.mapSource,
                onSelectionChanged: (value) {
                  print(value.toString());
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
      ),
    );
  }
}
// return SafeArea(
// child: Scaffold(
// appBar: AppBar(title: Text('Cemetery Map')),
// body: Container(
// height: mediaQueryData.size.height,
// width: mediaQueryData.size.width,
// child: Obx(
// () => ListView.builder(
// itemCount: controller.sections.length,
// itemBuilder: (context, index) {
// final section = controller.sections[index];
// return InkWell(
// onTap: () {
// controller.viewPlots();
// },
// child: ListTile(
// title: Text(section.sectionName),
// subtitle:
// Text('Number of Plots: ${section.numberOfPlot}'),
// trailing: Icon(
// section.isColumbarium ? Icons.check : Icons.close),
// // You can add more information here.
// ),
// );
// },
// ),
// ),
// )),
// );
