import 'package:flutter/material.dart';

class Palette {
  static const basicColor = Color(0xFFF3F6F8);
  static const kBackgroundColor = Color(0xfff7f4e0);

  static const MaterialColor colorPrimarySwatch = MaterialColor(
    0xff202020,
    <int, Color>{
      50: Color(
        0xff383838,
      ),
      100: Color(0x32fff7f4),
      200: Color(0xFFFFFFFF),
      300: Color(0xFFFFFFFF),
      400: Color(0xFFFFFFFF),
      500: Color(0xFFFFFFFF),
      600: Color(0xFFFFFFFF),
      700: Color(0xFFFFFFFF),
      800: Color(0xFFFFFFFF),
      900: Color(0xFFFFFFFF),
    },
  );
  static const TextStyle basicStyle = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.normal,
    color: Colors.black,
    fontStyle: FontStyle.normal,
    decoration: TextDecoration.none,
    letterSpacing: 0.0,
  );
}
