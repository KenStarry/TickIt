import 'package:flutter/material.dart';

import '../../../../core/presentation/components/feedback_banner.dart';
import 'bottom_navigation.dart';

ValueNotifier<bool> showNavigation = ValueNotifier(true);

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

        ValueListenableBuilder(
          valueListenable: showNavigation,
          builder: (BuildContext context, value, Widget? child) => Visibility(
            visible: value,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: BottomNavigation(),
            ),
          ),
        ),

        const FeedbackBanner(),
      ],
    );
  }
}
