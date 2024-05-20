import 'package:erp_reposteria/constants.dart';
import 'package:flutter/material.dart';

class InventoryDesktopScaffold extends StatefulWidget {
  const InventoryDesktopScaffold({super.key});

  @override
  State<InventoryDesktopScaffold> createState() => _InventoryDesktopScaffoldState();
}

class _InventoryDesktopScaffoldState extends State<InventoryDesktopScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar,
      backgroundColor: MyDefaultBackround,
      drawer: Builder(
        builder: (BuildContext context) {
        return buildDrawer(context);
    },
  ),
    );
  }
}