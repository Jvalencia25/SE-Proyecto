import 'package:erp_reposteria/constants.dart';
import 'package:flutter/material.dart';

class CatalogueMobileScaffold extends StatefulWidget {
  const CatalogueMobileScaffold({super.key});

  @override
  State<CatalogueMobileScaffold> createState() => _CatalogueMobileScaffoldState();
}

class _CatalogueMobileScaffoldState extends State<CatalogueMobileScaffold> {
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