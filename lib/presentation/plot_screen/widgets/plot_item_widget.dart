import 'package:flutter/material.dart';
import 'package:tdc_mobile/core/app_export.dart';
import 'package:tdc_mobile/presentation/plot_screen/controller/plot_controller.dart';

class PlotItem extends GetWidget<PlotController> {
   int index;

  PlotItem({
    Key? key,
    required this.index
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.toggleSelection(controller.plots[index]);
      },
      child: Obx(() =>  Container(
          decoration: BoxDecoration(
            color: controller.plots[index].isActive ? Colors.grey[800] : Colors.
            green[200],
            border: Border.all(color: Colors.black, width: 2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                bottom: 10,
                child: Text(
                  controller.plots[index].plotName,
                  style: TextStyle(
                    color: controller.plots[index].isActive  ? Colors.white70 : Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}