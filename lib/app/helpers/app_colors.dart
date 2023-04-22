import 'package:flutter/material.dart';

class AppColors {
  static const Color white = Color(0xFFFFFFFF);
  static const Color waterGreen = Color(0xFF87EBCD);
  static const Color redTemperature = Color(0xFFE74C3C);
  static const Color transparent = Colors.transparent;

  static const int _primary = 0xFF6D67D0;

  static const primary = MaterialColor(
    _primary,
    <int, Color>{
      50: Color(0xFFE7E6FB),
      100: Color(0xFFDAD8F7),
      300: Color(0xFFC2CEF2),
      400: Color(0xFFC2BFF4),
      500: Color(0xFF9D99E4),
      700: Color(0xFF8E87FA),
      1000: Color(_primary),
    },
  );

  static const int _yellow = 0xFFF6C833;

  static const yellow = MaterialColor(_yellow, <int, Color>{
    500: Color(0xFFFBDB60),
    900: Color(0xFFE5BB46),
    1000: Color(_yellow),
  });

  static LinearGradient yellowGradient = LinearGradient(colors: [
    yellow[500]!,
    transparent,
  ]);

  static const int _appThemePrimaryValue = 0xFF8E87FA;

  static const MaterialColor appTheme = MaterialColor(_appThemePrimaryValue, <int, Color>{
    50: Color(0xFFF1F1FE),
    100: Color(0xFFDDDBFE),
    200: Color(0xFFC7C3FD),
    300: Color(0xFFB0ABFC),
    400: Color(0xFF9F99FB),
    500: Color(_appThemePrimaryValue),
    600: Color(0xFF867FF9),
    700: Color(0xFF7B74F9),
    800: Color(0xFF716AF8),
    900: Color(0xFF5F57F6),
  });
}
