import 'package:erp_reposteria/start_responsive/start_desktop_scaffold.dart';
import 'package:erp_reposteria/start_responsive/start_mobile_scaffold.dart';
import 'package:erp_reposteria/start_responsive/start_responsive_layout.dart';
import 'package:erp_reposteria/start_responsive/start_tablet_scaffold.dart';
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
      home: StartResponsiveLayout(
        mobileScaffold: StartMobileScaffold(),
        tabletScaffold: StartTabletScaffold(),
        desktopScaffold: StartDesktopScaffold(),
      ),
      debugShowCheckedModeBanner: false

    );
  }
}
