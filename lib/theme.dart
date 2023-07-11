// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:viwaha_lk/appColor.dart';

class MyTheme {
  static ThemeData lightTheme = ThemeData(
    primarySwatch: ViwahaColor.primary,
    fontFamily: 'Roboto',
    textTheme: const TextTheme(
      headline1: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold),
      bodyText1: TextStyle(fontSize: 16.0),
    ),
  );

  static ThemeData darkTheme = ThemeData.dark().copyWith(
    primaryColor: Colors.green[800],
    hintColor: Colors.green[600],
  );
}
