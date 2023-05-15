import 'package:flutter/material.dart';

// class AppColors {
//   // static const Color primary = Color(0xfff24282);

// }

abstract class ViwahaColor {
  /// Completely invisible.
  static const Color transparent = Color(0x00000000);
  // static const Color primary = Color(0xfff24282);

  /// Completely opaque black.
  ///
  /// ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.blacks.png)
  ///
  /// See also:
  ///
  ///  * [black87], [black54], [black45], [black38], [black26], [black12], which
  ///    are variants on this color but with different opacities.
  ///  * [white], a solid white color.
  ///  * [transparent], a fully-transparent color.
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
}
