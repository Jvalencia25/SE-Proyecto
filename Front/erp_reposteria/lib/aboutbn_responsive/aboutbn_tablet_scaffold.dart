import 'package:erp_reposteria/constants.dart';
import 'package:flutter/material.dart';

class AboutbnTabletScaffold extends StatefulWidget {
  const AboutbnTabletScaffold({super.key});

  @override
  State<AboutbnTabletScaffold> createState() => _AboutbnTabletScaffoldState();
}

class _AboutbnTabletScaffoldState extends State<AboutbnTabletScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyStartAppBar(context),
      backgroundColor: MyDefaultBackround,
    );
  }
}