import 'package:erp_reposteria/constants.dart';
import 'package:flutter/material.dart';

class CatalogueDesktopScaffold extends StatefulWidget {
  const CatalogueDesktopScaffold({super.key});

  @override
  State<CatalogueDesktopScaffold> createState() => _CatalogueDesktopScaffoldState();
}

class _CatalogueDesktopScaffoldState extends State<CatalogueDesktopScaffold> {
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