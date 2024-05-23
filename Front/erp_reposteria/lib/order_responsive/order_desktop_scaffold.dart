import 'package:erp_reposteria/constants.dart';
import 'package:flutter/material.dart';

class OrderDesktopScaffold extends StatefulWidget {
  const OrderDesktopScaffold({super.key});

  @override
  State<OrderDesktopScaffold> createState() => _OrderDesktopScaffoldState();
}

class _OrderDesktopScaffoldState extends State<OrderDesktopScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar,
      backgroundColor: MyDefaultBackround,
      drawer: buildDrawer(context)
    );
  }
}