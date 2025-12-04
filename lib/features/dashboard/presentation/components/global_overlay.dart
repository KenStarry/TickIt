import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/presentation/components/feedback_banner.dart';

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

        const FeedbackBanner(),
      ],
    );
  }
}
