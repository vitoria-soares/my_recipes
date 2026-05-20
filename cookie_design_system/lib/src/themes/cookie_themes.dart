import 'package:cookie_design_system/src/constants/colors/cookie_colors.dart';
import 'package:cookie_design_system/src/constants/typography/cookie_font_sizes.dart';
import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';

abstract class CookieThemes {
  static ThemeData theme = ThemeData(
    primaryColor: CookieColors.yellow,
    useMaterial3: true,
    brightness: Brightness.light,
    textTheme: TextTheme(
      titleLarge: GoogleFonts.lobster(
        fontSize: CookieFontSizes.lg,
        fontWeight: FontWeight.w500,
      ),
      titleMedium: GoogleFonts.quicksand(
        fontSize: CookieFontSizes.md,
        fontWeight: FontWeight.w500,
      ),
      titleSmall: GoogleFonts.quicksand(
        fontSize: CookieFontSizes.sm,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}
