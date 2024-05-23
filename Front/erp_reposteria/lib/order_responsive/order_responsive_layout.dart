import 'package:flutter/material.dart';

class OrderResponsiveLayout extends StatelessWidget {
  final Widget desktopScaffold;

  OrderResponsiveLayout({
    required this.desktopScaffold,
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