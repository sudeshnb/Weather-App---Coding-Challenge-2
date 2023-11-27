library app_colors;

import 'package:flutter/material.dart';

class AppColor {
  static Color black = const Color(0xFF000000);
  static Color white = const Color(0xFFFFFFFF);

  static Color red = Colors.red;

  static Color card = const Color.fromRGBO(170, 165, 165, 0.7);

  static Color whiteText = const Color(0xFFECECEC);

  static List<Color> background = [
    const Color(0xFF391A49),
    const Color(0xFF301D5C),
    const Color(0xFF262171),
    const Color(0xFF301D5C),
    const Color(0xFF391A49),
  ];
  static LinearGradient shimmerGradient = const LinearGradient(
    colors: [
      // Color(0xFFEBEBF4),
      // Color(0xFFF4F4F4),
      // Color(0xFFEBEBF4),
      Color(0xFF391A49),
      Color(0xFF301D5C),
      Color(0xFF391A49),
    ],
    stops: [
      0.1,
      0.3,
      0.4,
    ],
    begin: Alignment(-1.0, -0.3),
    end: Alignment(1.0, 0.3),
    tileMode: TileMode.clamp,
  );
}
