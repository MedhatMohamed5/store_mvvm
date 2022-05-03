import 'package:flutter/material.dart';
import 'package:store_mvvm/presentation/resource/theme/colors/color_extension.dart';

class ColorManager {
  static Color primary = HexColor.fromHex('#ED9728'); // = const Color(0xffED9728);
  static Color darkGray = HexColor.fromHex('#252525');
  static Color grey = HexColor.fromHex('#737477');
  static Color lightGrey = HexColor.fromHex('#9e9e9e');
  static Color primaryOpacity70 = HexColor.fromHex('#b3ED9728');

  // Dark Colors
  static Color darkPrimary = HexColor.fromHex('#d17d11');
  static Color grey1 = HexColor.fromHex('#707070');
  static Color grey2 = HexColor.fromHex('#797979');

  static Color white = HexColor.fromHex('#ffffff');
  static Color error = HexColor.fromHex('#e61f34');
}
