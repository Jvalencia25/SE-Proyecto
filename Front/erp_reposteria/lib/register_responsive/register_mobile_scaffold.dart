import 'package:erp_reposteria/constants.dart';
import 'package:flutter/material.dart';

class RegisterMobileScaffold extends StatefulWidget {
  const RegisterMobileScaffold({super.key});

  @override
  State<RegisterMobileScaffold> createState() => _RegisterMobileScaffoldState();
}

class _RegisterMobileScaffoldState extends State<RegisterMobileScaffold> {
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