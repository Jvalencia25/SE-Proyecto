import 'package:erp_reposteria/constants.dart';
import 'package:flutter/material.dart';

class AboutbnMobileScaffold extends StatefulWidget {
  const AboutbnMobileScaffold({super.key});

  @override
  State<AboutbnMobileScaffold> createState() => _AboutbnMobileScaffoldState();
}

class _AboutbnMobileScaffoldState extends State<AboutbnMobileScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyStartAppBar(context),
      backgroundColor: MyDefaultBackround,
    );
  }
}