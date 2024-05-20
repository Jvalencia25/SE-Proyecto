import 'package:erp_reposteria/login_responsive/login_desktop_scaffold.dart';
import 'package:erp_reposteria/login_responsive/login_mobile_scaffold.dart';
import 'package:erp_reposteria/login_responsive/login_tablet_scaffold.dart';
import 'package:flutter/material.dart';

class LoginResponsiveLayout extends StatelessWidget {
  final Widget mobileScaffold;
  final Widget tabletScaffold;
  final Widget desktopScaffold;

  LoginResponsiveLayout({
    this.mobileScaffold = const LoginMobileScaffold(),
    this.tabletScaffold = const LoginTabletScaffold(),
    this.desktopScaffold = const LoginDesktopScaffold(),
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