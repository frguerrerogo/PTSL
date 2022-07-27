import 'package:flutter/material.dart';

class AppColors {
  // Static color constants
  static const Color primaryColor = Color.fromARGB(255, 204, 0, 0);
  static const Color secondaryColor = Color.fromARGB(255, 240, 210, 80);

  static const Color darkPrimaryColor = Color(0xff3366C6);
  static const Color accentColor = Color(0xffe53766);
  static const Color textPrimaryColor = Color(0xFF212121);
  static const Color textSecondaryColor = Color(0xFF757575);
  static const Color accentColorDarkTheme = Color(0xFF9E9E9E);

  static ColorScheme lightScheme = const ColorScheme.light(
    primary: primaryColor,
  );

  static ColorScheme darkScheme = const ColorScheme.dark();
}
