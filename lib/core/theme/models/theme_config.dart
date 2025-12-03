import 'package:flutter/material.dart';
import 'package:tickit/core/theme/extensions/tickit_colors.dart';

class TickItThemeConfig {
  final ColorScheme scheme;
  final TickItColors colors;

  const TickItThemeConfig({
    required this.scheme,
    required this.colors
  });
}