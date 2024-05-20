import 'package:erp_reposteria/constants.dart';
import 'package:flutter/material.dart';

class RegisterTabletScaffold extends StatefulWidget {
  const RegisterTabletScaffold({super.key});

  @override
  State<RegisterTabletScaffold> createState() => _RegisterTabletScaffoldState();
}

class _RegisterTabletScaffoldState extends State<RegisterTabletScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar,
      backgroundColor: MyDefaultBackround,
      drawer: MyDrawer,
    );
  }
}