import 'package:flutter/material.dart';
import 'package:animations/animations.dart';

/// Material Container Motion Flutter
Widget addMaterialContainerMotion(
  BuildContext context, {
  Color? openColor,
  Color? middleColor,
  Color? closedColor,
  Duration? duration,
  double? openElevation,
  RoundedRectangleBorder? openShape,
  RoundedRectangleBorder? closedShape,
  required Widget Function(BuildContext, void Function()) closedBuilder,
  required void Function(Never?)? onClosed,
  required Widget Function(BuildContext, void Function({Never? returnValue}))
  openBuilder,
}) => OpenContainer(
  closedColor: closedColor ?? Colors.transparent,
  openColor: openColor ?? Colors.transparent,
  middleColor: middleColor ?? Colors.transparent,
  closedElevation: 0,
  openElevation: openElevation ?? 0,
  openShape:
      openShape ??
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
  closedShape:
      closedShape ??
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
  useRootNavigator: true,
  transitionType: ContainerTransitionType.fade,
  transitionDuration: duration ?? const Duration(milliseconds: 700),
  closedBuilder: closedBuilder,
  openBuilder: openBuilder,
  onClosed: onClosed,
);
