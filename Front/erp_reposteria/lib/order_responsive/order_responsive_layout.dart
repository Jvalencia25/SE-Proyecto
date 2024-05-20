import 'package:erp_reposteria/order_responsive/order_desktop_scaffold.dart';
import 'package:erp_reposteria/order_responsive/order_mobile_scaffold.dart';
import 'package:erp_reposteria/order_responsive/order_tablet_scaffold.dart';
import 'package:flutter/material.dart';

class OrderResponsiveLayout extends StatelessWidget {
  final Widget mobileScaffold;
  final Widget tabletScaffold;
  final Widget desktopScaffold;

  OrderResponsiveLayout({
    this.mobileScaffold = const OrderMobileScaffold(),
    this.tabletScaffold = const OrderTabletScaffold(),
    this.desktopScaffold = const OrderDesktopScaffold(),
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