import 'package:erp_reposteria/register_responsive/register_desktop_scaffold.dart';
import 'package:erp_reposteria/register_responsive/register_mobile_scaffold.dart';
import 'package:erp_reposteria/register_responsive/register_tablet_scaffold.dart';
import 'package:flutter/material.dart';

class RegisterResponsiveLayout extends StatelessWidget {
  final Widget mobileScaffold;
  final Widget tabletScaffold;
  final Widget desktopScaffold;

  RegisterResponsiveLayout({
    this.mobileScaffold = const RegisterMobileScaffold(),
    this.tabletScaffold = const RegisterTabletScaffold(),
    this.desktopScaffold = const RegisterDesktopScaffold(),
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