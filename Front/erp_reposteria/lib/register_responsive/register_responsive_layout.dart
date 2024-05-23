import 'package:flutter/material.dart';

class RegisterResponsiveLayout extends StatelessWidget {
  final Widget desktopScaffold;

  RegisterResponsiveLayout({
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