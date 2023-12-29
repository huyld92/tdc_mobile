import 'package:flutter/material.dart';
import 'package:tdc_mobile/core/app_export.dart';
import 'package:tdc_mobile/presentation/plot_screen/controller/plot_controller.dart';

class PlotScreen extends GetWidget<PlotController> {

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Select Plots in ${controller.sectionName}'),
      ),
      body: Container(
        color: Colors.blue,
      )
    );
  }
}