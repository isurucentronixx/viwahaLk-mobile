// ignore_for_file: file_names

import 'package:flutter/material.dart';

abstract class ViwahaColor {
  static const Color transparent = Color(0x00000000);
  static const Color black = Color(0xFF000000);

  static const MaterialColor primary = MaterialColor(
    viwahaPrimaryColor,
    <int, Color>{
      50: Color(0xfff24282),
      100: Color(0xfff24282),
      200: Color(0xfff24282),
      300: Color(0xfff24282),
      400: Color(0xfff24282),
      500: Color(viwahaPrimaryColor),
      600: Color(0xfff24282),
      700: Color(0xfff24282),
      800: Color(0xfff24282),
      900: Color(0xfff24282),
    },
  );
  static const int viwahaPrimaryColor = 0xfff24282;
  static const int overlayColor = 0xff222e4c;
}
