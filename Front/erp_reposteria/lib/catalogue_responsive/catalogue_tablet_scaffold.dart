import 'package:erp_reposteria/constants.dart';
import 'package:flutter/material.dart';

class CatalogueTabletScaffold extends StatefulWidget {
  const CatalogueTabletScaffold({super.key});

  @override
  State<CatalogueTabletScaffold> createState() => _CatalogueTabletScaffoldState();
}

class _CatalogueTabletScaffoldState extends State<CatalogueTabletScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar,
      backgroundColor: MyDefaultBackround,
      drawer: MyDrawer,
    );
  }
}