import 'package:erp_reposteria/constants.dart';
import 'package:flutter/material.dart';

class RegisterDesktopScaffold extends StatefulWidget {
  const RegisterDesktopScaffold({super.key});

  @override
  State<RegisterDesktopScaffold> createState() => _RegisterDesktopScaffoldState();
}

class _RegisterDesktopScaffoldState extends State<RegisterDesktopScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar,
      backgroundColor: MyDefaultBackround,
      drawer: MyDrawer,
    );
  }
}