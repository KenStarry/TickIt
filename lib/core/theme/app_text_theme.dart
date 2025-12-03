import 'package:flutter/material.dart';
import 'package:tickit/core/theme/extensions/tickit_colors.dart';

class AppTextTheme {

  static TextTheme fromColors(TickItColors colors) {
    return TextTheme(
      bodyLarge: TextStyle(
        color: colors.textBlack800,
        fontFamily: "Urbanist",
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      bodyMedium: TextStyle(
        color: colors.textBlack600,
        fontFamily: "Urbanist",
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      bodySmall: TextStyle(
        color: colors.textBlack600,
        fontFamily: "Urbanist",
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
      titleLarge: TextStyle(
        color: colors.textBlack900,
        fontFamily: "Urbanist",
        fontSize: 28,
        fontWeight: FontWeight.w700,
      ),
      titleMedium: TextStyle(
        color: colors.textBlack900,
        fontFamily: "Urbanist",
        fontSize: 24,
        fontWeight: FontWeight.w700,
      ),
      titleSmall: TextStyle(
        color: colors.textBlack800,
        fontFamily: "Urbanist",
        fontSize: 20,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}