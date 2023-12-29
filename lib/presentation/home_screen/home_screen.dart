import 'controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:tdc_mobile/core/app_export.dart';

class HomeScreen extends GetWidget<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
      // backgroundColor: Colors.blue,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Interactive Map
            InkWell(
              onTap: () {
                controller.viewMap();
              },
              child: Container(
                height: 200, // Adjust the height as needed
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                // Include your interactive map widget here
                child: Center(
                  child: Text('Interactive Map',
                      style: CustomTextStyles.titleLarge16Gray900),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
