import 'package:erp_reposteria/responsive/desktop_scaffold.dart';
import 'package:erp_reposteria/responsive/mobile_scaffold.dart';
import 'package:erp_reposteria/responsive/responsive_layout.dart';
import 'package:erp_reposteria/responsive/tablet_scaffold.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ResponsiveLayout(
        mobileScaffold: const MobileScaffold(),
        tabletScaffold: const TabletScaffold(),
        desktopScaffold: const DesktopScaffold(),
      ),
      debugShowCheckedModeBanner: false

    );
  }
}
