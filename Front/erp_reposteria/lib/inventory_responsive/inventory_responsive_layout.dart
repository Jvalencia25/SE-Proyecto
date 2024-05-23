import 'package:erp_reposteria/inventory_responsive/inventory_mobile_scaffold.dart';
import 'package:erp_reposteria/inventory_responsive/inventory_tablet_scaffold.dart';
import 'package:flutter/material.dart';

class InventoryResponsiveLayout extends StatelessWidget {
  final Widget mobileScaffold;
  final Widget tabletScaffold;
  final Widget desktopScaffold;

  InventoryResponsiveLayout({
    this.mobileScaffold = const InventoryMobileScaffold(),
    this.tabletScaffold = const InventoryTabletScaffold(),
    required this.desktopScaffold,
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