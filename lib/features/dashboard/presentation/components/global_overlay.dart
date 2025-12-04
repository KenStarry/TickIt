import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/presentation/components/feedback_banner.dart';
import 'navigation_basic.dart';

class GlobalOverlay extends StatefulWidget {
  final Widget child;

  const GlobalOverlay({super.key, required this.child});

  @override
  State<GlobalOverlay> createState() => _GlobalOverlayState();
}

class _GlobalOverlayState extends State<GlobalOverlay> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.child,

        Align(alignment: Alignment.bottomCenter, child: BottomNavigation()),

        const FeedbackBanner(),
      ],
    );
  }
}
