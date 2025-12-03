import 'package:flutter/material.dart';

class AppTextTheme {
  /// For Material-based themes
  static TextTheme fromColorScheme(ColorScheme scheme) {
    return TextTheme(
      displayLarge: TextStyle(
          color: scheme.onBackground,
          fontSize: 32,
          fontWeight: FontWeight.bold),
      displayMedium: TextStyle(
          color: scheme.onBackground,
          fontSize: 28,
          fontWeight: FontWeight.w700),
      headlineLarge: TextStyle(
          color: scheme.onSurface, fontSize: 24, fontWeight: FontWeight.w700),
      headlineMedium: TextStyle(
          color: scheme.onSurfaceVariant,
          fontSize: 20,
          fontWeight: FontWeight.w600),
      titleLarge: TextStyle(
          color: scheme.onPrimary, fontSize: 18, fontWeight: FontWeight.w600),
      bodyLarge: TextStyle(
          color: scheme.onBackground,
          fontSize: 16,
          fontWeight: FontWeight.w500),
      bodyMedium: TextStyle(
          color: scheme.onBackground.withOpacity(0.8),
          fontSize: 14,
          fontWeight: FontWeight.w400),
      labelLarge: TextStyle(
          color: scheme.primary, fontSize: 12, fontWeight: FontWeight.w600),
    );
  }
}