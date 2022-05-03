import 'package:flutter/material.dart';
import 'package:store_mvvm/presentation/resource/theme/fonts/font_manager.dart';

TextStyle _getTextStyle(
  double fontSize,
  String fontFamily,
  Color color,
  FontWeight fontWeight,
) {
  return TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSize,
    color: color,
  );
}

TextStyle getTextStyle({
  double fontSize = FontManager.s12,
  required Color color,
  FontWeight fontWeight = FontManager.regular,
}) {
  return _getTextStyle(fontSize, FontManager.fontFamily, color, fontWeight);
}
