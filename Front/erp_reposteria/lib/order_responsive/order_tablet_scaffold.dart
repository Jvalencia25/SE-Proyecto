import 'package:erp_reposteria/constants.dart';
import 'package:flutter/material.dart';

class OrderTabletScaffold extends StatefulWidget {
  const OrderTabletScaffold({super.key});

  @override
  State<OrderTabletScaffold> createState() => _OrderTabletScaffoldState();
}

class _OrderTabletScaffoldState extends State<OrderTabletScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar,
      backgroundColor: MyDefaultBackround,
      drawer: MyDrawer,
    );
  }
}