// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:viwaha_lk/appColor.dart';

class MyTheme {
  static ThemeData lightTheme = ThemeData(
    primarySwatch: ViwahaColor.primary,
    fontFamily: 'Roboto',
    textTheme: const TextTheme(
      headline1: TextStyle(fontSize: 36.0, fontWeight: FontWeight.w600),
      bodyText1: TextStyle(fontSize: 16.0),
    ),
  );
}
