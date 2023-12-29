import 'dart:ui';
import 'package:flutter/material.dart';

class ColorConstant {

  static Color softGreen = fromHex('#87ab87');

  static Color white = fromHex('#FFFFFF');

  static Color green300 = fromHex('#81C784');

  static Color green400 = fromHex('#66BB6A');

  static Color gray900 = fromHex('#212121');

  static Color blueGray100 = fromHex('#CFD8DC');

  static Color blueGray50 = fromHex('#ECEFF1');

  static Color black = fromHex('#000000');


  static Color red50 = fromHex('#FFEBEE');

  static Color redA200 = fromHex('#FF5252');


  static Color blueA700 = fromHex('#1976D2');

  static Color blue700 = fromHex('#1976D2');

  static Color blue600 = fromHex('#1E88E5');

  static Color blue50 = fromHex('#E3F2FD');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
