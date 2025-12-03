import 'package:flutter/material.dart';
import 'package:tickit/core/theme/extensions/tickit_colors.dart';

extension ContextExtensions on BuildContext {
  TickItColors get colors => Theme.of(this).extension<TickItColors>()!;
}