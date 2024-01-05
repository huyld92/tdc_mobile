import 'package:flutter/material.dart';
import 'package:tdc_mobile/core/app_export.dart';
import 'package:tdc_mobile/data/model/section_model.dart';
import 'package:syncfusion_flutter_maps/maps.dart';

class MapController extends GetxController {
  final RxList<SectionModel> sections = <SectionModel>[].obs;
  late List<Model> data;
  late List<ModelPlot> plotMarker;
  late MapShapeSource mapSource;

  @override
  void onInit() {
    data = const <Model>[
      Model(
          state: 'K9', color: Color.fromRGBO(255, 215, 0, 1.0), stateCode: '9'),
      Model(state: 'K8',color:Color.fromRGBO(173, 161, 95, 1.0), stateCode: '8'),
      Model(state: 'K14', color:Color.fromRGBO(72, 209, 204, 1.0), stateCode: '14'),
      Model(state: 'K15',color: Color.fromRGBO(255, 78, 66, 1.0),  stateCode:'15'),
      Model(state: 'K17', color:Color.fromRGBO(171, 56, 224, 0.75),  stateCode:'17'),
      Model(state: 'K16',color: Color.fromRGBO(79, 60, 201, 0.7),  stateCode:'16'),
      Model(state: 'K3',color: Color.fromRGBO(99, 164, 230, 1),  stateCode:'3'),
      Model(state: 'K4',color: Color.fromRGBO(103, 230, 99, 1.0),  stateCode:'4'),
      Model(state: 'K10',color: Colors.teal,  stateCode:'10'),
      Model(state: 'K11',color: Color.fromRGBO(174, 255, 235, 1.0), stateCode: '11'),
      Model(state: 'K12',color: Color.fromRGBO(32, 248, 195, 1.0),  stateCode:'12'),
      Model(state: 'K5', color:Color.fromRGBO(157, 138, 243, 1.0),  stateCode:'5'),
      Model(state: 'K2',color: Color.fromRGBO(10, 176, 136, 1.0),  stateCode:'2'),
      Model(state: 'K6',color: Color.fromRGBO(236, 207, 87, 1.0),  stateCode:'6'),
      Model(state: 'K1',color: Color.fromRGBO(243, 93, 222, 1.0),  stateCode:'1'),
      Model(state: 'K7',color: Color.fromRGBO(184, 169, 229, 1.0), stateCode: '7'),
      Model(state: 'K13', color:Color.fromRGBO(255, 83, 83, 1.0), stateCode: '13'),
      Model(state: 'Nha \nLưu Cốt',color: Color.fromRGBO(255, 176, 67, 1.0),  stateCode:'LC'),
    ];

    mapSource = MapShapeSource.asset(
      'assets/australia.json',
      shapeDataField: 'STATE_CODE',
      dataCount: data.length,
      primaryValueMapper: (int index) => data[index].stateCode,
      dataLabelMapper: (int index) => data[index].state,
      shapeColorValueMapper: (int index) => data[index].color,
    );

    super.onInit();
    // Populate the 'sections' list with your data (e.g., fetch from an API or database).
    // sections.addAll([
    //   SectionModel(
    //       sectionID: 1,
    //       sectionName: "Section 1",
    //       numberOfPlot: 10,
    //       isColumbarium: true,
    //       cemeteryID: 1,
    //       plots:
    //           List.generate(5, (index) => PlotModel(plotID: 1, plotName: "2"))),
    //   SectionModel(
    //       sectionID: 2,
    //       sectionName: "Section 2",
    //       numberOfPlot: 15,
    //       isColumbarium: false,
    //       cemeteryID: 1,
    //       plots:
    //           List.generate(5, (index) => PlotModel(plotID: 1, plotName: "2"))),
    //   // Add more sections as needed.
    // ]);
  }

  void viewPlots(int index) {
    var state = data[index]. state;
    Get.toNamed(AppRoutes.plotScreen, arguments: state);
  }

  void getBack() {Get.back();}
}

/// Collection of Australia state code data.
class Model {
  /// Initialize the instance of the [Model] class.
  const Model(
      {required this.state,
      required this.color,
      required this.stateCode,
      this.modelPlot});

  /// Represents the Australia state name.
  final String state;

  /// Represents the Australia state color.
  final Color color;

  /// Represents the Australia state code.
  final String stateCode;

  final ModelPlot? modelPlot;
}

class ModelPlot {
  const ModelPlot(
      {required this.plotName,
      required this.latitude,
      required this.longitude});

  final String plotName;
  final double latitude;
  final double longitude;
}
