import 'package:cookie_design_system/src/constants/colors/cookie_colors.dart';
import 'package:dependencies_module/dependencies_module.dart';
import 'package:flutter/material.dart';

abstract class CookieThemes {
  static ThemeData theme = ThemeData(
    primaryColor: CookieColors.yellow,
    useMaterial3: true,
    brightness: Brightness.light,
    textTheme: TextTheme(
      titleMedium: GoogleFonts.ptSans(
        fontSize: 28,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}
