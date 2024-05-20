import 'package:erp_reposteria/catalogue_responsive/catalogue_desktop_scaffold.dart';
import 'package:erp_reposteria/catalogue_responsive/catalogue_mobile_scaffold.dart';
import 'package:erp_reposteria/catalogue_responsive/catalogue_tablet_scaffold.dart';
import 'package:flutter/material.dart';

class CatalogueResponsiveLayout extends StatelessWidget {
  final Widget mobileScaffold;
  final Widget tabletScaffold;
  final Widget desktopScaffold;

  CatalogueResponsiveLayout({
    this.mobileScaffold = const CatalogueMobileScaffold(),
    this.tabletScaffold = const CatalogueTabletScaffold(),
    this.desktopScaffold = const CatalogueDesktopScaffold(),
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