import 'package:flutter/material.dart';

class InventoryResponsiveLayout extends StatelessWidget {
  
  final Widget desktopScaffold;

  InventoryResponsiveLayout({
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