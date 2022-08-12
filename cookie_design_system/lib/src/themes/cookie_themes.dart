import 'package:cookie_design_system/src/constants/colors/cookie_colors.dart';
import 'package:dependencies_module/dependencies_module.dart';
import 'package:flutter/material.dart';

abstract class CookieThemes {
  static ThemeData theme = ThemeData(
    primaryColor: CookieColors.yellow,
    useMaterial3: true,
    brightness: Brightness.light,
    textTheme: TextTheme(
      titleLarge: GoogleFonts.lobster(
        fontSize: 26,
        fontWeight: FontWeight.w500,
      ),
      titleMedium: GoogleFonts.quicksand(
        fontSize: 22,
        fontWeight: FontWeight.w500,
      ),
      titleSmall: GoogleFonts.quicksand(
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}
