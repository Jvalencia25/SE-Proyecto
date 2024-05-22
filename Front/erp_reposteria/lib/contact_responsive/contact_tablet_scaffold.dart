import 'package:erp_reposteria/constants.dart';
import 'package:flutter/material.dart';

class ContactTabletScaffold extends StatefulWidget {
  const ContactTabletScaffold({super.key});

  @override
  State<ContactTabletScaffold> createState() => _ContactTabletScaffoldState();
}

class _ContactTabletScaffoldState extends State<ContactTabletScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyStartAppBar(context),
      backgroundColor: MyDefaultBackround,
    );
  }
}