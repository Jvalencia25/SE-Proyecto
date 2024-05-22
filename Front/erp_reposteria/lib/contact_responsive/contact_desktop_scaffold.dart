import 'package:erp_reposteria/constants.dart';
import 'package:flutter/material.dart';

class ContactDesktopScaffold extends StatefulWidget {
  const ContactDesktopScaffold({super.key});

  @override
  State<ContactDesktopScaffold> createState() => _ContactDesktopScaffoldState();
}

class _ContactDesktopScaffoldState extends State<ContactDesktopScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyStartAppBar(context),
      backgroundColor: MyDefaultBackround,
    );
  }
}