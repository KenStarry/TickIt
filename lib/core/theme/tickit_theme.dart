import 'package:flutter/material.dart';
import 'package:tickit/core/theme/extensions/tickit_colors.dart';

import 'app_text_theme.dart';
import 'models/theme_config.dart';

TickItThemeConfig resolveTheme({
  required Brightness brightness,
  required Color? seedColor
}) {
  final scheme = ColorScheme.fromSeed(
    brightness: brightness,
    seedColor: seedColor ?? Colors.teal,
  );
  return TickItThemeConfig(
      scheme: scheme,
      colors: TickItColors.fromScheme(scheme));
}

ThemeData buildTheme(TickItThemeConfig config) {
  final scheme = config.scheme;
  final colors = config.colors;

  return ThemeData(
    useMaterial3: true,
    colorScheme: scheme,
    extensions: [colors],
    scaffoldBackgroundColor: scheme.background,
    canvasColor: scheme.background,
    dividerColor: Colors.transparent,
    fontFamily: "Urbanist",
    textTheme: AppTextTheme.fromColorScheme(scheme),
    // or fromColorScheme
    appBarTheme: AppBarTheme(
      backgroundColor: scheme.surface,
      iconTheme: IconThemeData(color: scheme.onSurface),
      titleTextStyle: TextStyle(
        color: scheme.onSurface,
        fontSize: 24.0,
        fontWeight: FontWeight.w700,
      ),
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: scheme.surface,
      surfaceTintColor: scheme.surface,
      dragHandleColor: scheme.outlineVariant,
      dragHandleSize: const Size(80, 3),
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: scheme.primary,
      contentTextStyle: TextStyle(
        color: scheme.onPrimary,
        fontSize: 14.0,
        fontWeight: FontWeight.w700,
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: scheme.primary,
        foregroundColor: scheme.onPrimary,
        minimumSize: const Size(double.infinity, 58),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      ),
    ),
  );
}