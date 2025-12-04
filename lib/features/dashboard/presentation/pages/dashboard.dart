import 'package:flutter/material.dart';
import 'package:tickit/core/utils/extensions/context_extensions.dart';

class Dashboard extends StatefulWidget {

  final Widget child;

  const Dashboard({super.key, required this.child});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.backgroundColor,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: widget.child,
      ),
    );
  }
}
