import 'package:flutter/material.dart';

class AppColors {
  static const primary = Color.fromRGBO(86, 118, 229, 1);
  static const white = Color(0xFFFFFF);
  static const black = Color(0xFF000000);
  static const colorButton = Color.fromRGBO(43, 72, 224, 1);
  static HexColor grey = HexColor("#DADBDE");
  static HexColor greyLight = HexColor("#EFEEEE");
  static const shimmerDefault = Color(0xFFB2DFDB);
  static const shimmerAnimated = Color(0xFF80CBC4);
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
