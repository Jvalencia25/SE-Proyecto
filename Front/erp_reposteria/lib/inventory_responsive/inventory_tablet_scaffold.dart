import 'package:erp_reposteria/constants.dart';
import 'package:flutter/material.dart';
class InventoryTabletScaffold extends StatefulWidget {
  const InventoryTabletScaffold({super.key});

  @override
  State<InventoryTabletScaffold> createState() => _InventoryTabletScaffoldState();
}

class _InventoryTabletScaffoldState extends State<InventoryTabletScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar,
      backgroundColor: MyDefaultBackround,
      drawer: buildDrawer(context)
    );
  }
}