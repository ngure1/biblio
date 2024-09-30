import 'package:biblio/core/theming/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.surfaceColor,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      progressIndicatorTheme:
          ProgressIndicatorThemeData(color: AppColors.primaryInverseColor));
}
