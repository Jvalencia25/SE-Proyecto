// ignore_for_file: use_key_in_widget_constructors
import 'package:flutter/material.dart';

class StartResponsiveLayout extends StatelessWidget {
  final Widget mobileScaffold;
  final Widget tabletScaffold;
  final Widget desktopScaffold;

  StartResponsiveLayout({
    required this.mobileScaffold,
    required this.tabletScaffold,
    required this.desktopScaffold
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 500) {
          return mobileScaffold;
        } else if (constraints.maxWidth < 900) {
          return tabletScaffold;
        } else {
          return desktopScaffold;
        }
      },
    );
  }
}