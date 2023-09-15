// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> en = {
  "home_main_title": "Discover everything you need to plan your big day"
};
static const Map<String,dynamic> si = {
  "home_main_title": "ඔබේ විවාහ දිනය සැලසුම් කිරීමට අවශ්‍ය සියල්ල ඉක්මනින් සොයා ගන්න."
};
static const Map<String,dynamic> ta = {
  "home_main_title": "உங்கள் திருமண நாளைத் திட்டமிட தேவையான அனைத்தையும் கண்டறியவும்"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": en, "si": si, "ta": ta};
}
