import 'package:flutter/material.dart';

class CatalogueResponsiveLayout extends StatelessWidget { 
  final Widget desktopScaffold;

  CatalogueResponsiveLayout({
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