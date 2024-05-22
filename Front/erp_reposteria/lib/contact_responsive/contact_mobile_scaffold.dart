import 'package:erp_reposteria/constants.dart';
import 'package:flutter/material.dart';

class ContactMobileScaffold extends StatefulWidget {
  const ContactMobileScaffold({super.key});

  @override
  State<ContactMobileScaffold> createState() => _ContactMobileScaffoldState();
}

class _ContactMobileScaffoldState extends State<ContactMobileScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyStartAppBar(context),
      backgroundColor: MyDefaultBackround,
    );
  }
}