// ignore_for_file: use_key_in_widget_constructors
import 'package:flutter/material.dart';

class StartResponsiveLayout extends StatelessWidget {
  final Widget desktopScaffold;

  StartResponsiveLayout({
    required this.desktopScaffold
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return desktopScaffold;
      },
    );
  }
}