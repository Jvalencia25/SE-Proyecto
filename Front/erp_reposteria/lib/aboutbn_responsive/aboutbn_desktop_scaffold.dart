import 'package:erp_reposteria/constants.dart';
import 'package:flutter/material.dart';

class AboutbnDesktopScaffold extends StatefulWidget {
  const AboutbnDesktopScaffold({super.key});

  @override
  State<AboutbnDesktopScaffold> createState() => _AboutbnDesktopScaffoldState();
}

class _AboutbnDesktopScaffoldState extends State<AboutbnDesktopScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyStartAppBar(context),
      backgroundColor: MyDefaultBackround,
    );
  }
}