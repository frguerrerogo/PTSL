import 'package:flutter/material.dart';
import 'package:ptsl/ui/theme/colors.dart';

class AppTextStyle {
  static String? get fontFamily => "Pokemon";

  static TextStyle get defaultFontStyle => const TextStyle(
        fontFamily: 'Pokemon',
      );

  // Headline 1
  static TextStyle get headline1 => const TextStyle(
        fontFamily: 'Pokemon',
        color: AppColors.primaryColor,
        fontWeight: FontWeight.bold,
        fontSize: 60,
      );

  // Headline 2
  static TextStyle get headline2 => const TextStyle(
        fontFamily: 'Pokemon',
        color: AppColors.secondaryColor,
        fontWeight: FontWeight.bold,
        fontSize: 40,
      );
  // Headline 3
  static TextStyle get headline3 => const TextStyle(
        fontFamily: 'Pokemon',
        color: AppColors.secondaryColor,
        fontWeight: FontWeight.bold,
        fontSize: 30,
      );
  // Headline 4
  static TextStyle get headline4 => const TextStyle(
        fontFamily: 'Pokemon',
        color: AppColors.secondaryColor,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      );
  // Headline 5
  static TextStyle get headline5 => const TextStyle(
        fontFamily: 'Pokemon',
        color: AppColors.primaryColor,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      );
  // Headline 4
  static TextStyle get headline6 => const TextStyle(
        fontFamily: 'Pokemon',
        color: AppColors.primaryColor,
        fontWeight: FontWeight.bold,
        fontSize: 15,
      );
  // Bodytext 1
  static TextStyle get bodytext1 => const TextStyle(
        fontFamily: 'Pokemon',
        color: Colors.red,
        fontWeight: FontWeight.bold,
        fontSize: 30,
      );

  static TextTheme get textTheme => TextTheme(
        headline1: headline1,
        headline2: headline2,
        headline3: headline3,
        headline4: headline4,
        headline5: headline5,
        headline6: headline6,
        bodyText1: bodytext1,
      );
}
