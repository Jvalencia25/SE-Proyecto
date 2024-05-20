import 'package:erp_reposteria/constants.dart';
import 'package:flutter/material.dart';

class InventoryMobileScaffold extends StatefulWidget {
  const InventoryMobileScaffold({super.key});

  @override
  State<InventoryMobileScaffold> createState() => _InventoryMobileScaffoldState();
}

class _InventoryMobileScaffoldState extends State<InventoryMobileScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar,
      drawer: Builder(
        builder: (BuildContext context) {
        return buildDrawer(context);
    },
  ),
    );
  }
}