import 'package:flutter/material.dart';

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = "ff" + hexColorString;
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}
