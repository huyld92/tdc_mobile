import 'package:flutter/material.dart';
 import 'package:tdc_mobile/presentation/search_screen/controller/search_controller.dart'
    as search_controller;
import 'package:tdc_mobile/core/app_export.dart';

class SearchScreen extends GetWidget<search_controller.SearchController> {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('Cemetery Map')),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // ... existing widgets

                  SizedBox(height: 16),

                  // Search Section
                  Text(
                    'Deceased Search',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'Full Name'),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(labelText: 'From Year'),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(labelText: 'To Year'),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  TextField(
                    decoration: InputDecoration(labelText: 'Location'),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      // Handle search logic here
                    },
                    child: Text('Search'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
