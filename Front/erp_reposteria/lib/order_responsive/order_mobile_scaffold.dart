import 'package:erp_reposteria/constants.dart';
import 'package:flutter/material.dart';

class OrderMobileScaffold extends StatefulWidget {
  const OrderMobileScaffold({super.key});

  @override
  State<OrderMobileScaffold> createState() => _OrderMobileScaffoldState();
}

class _OrderMobileScaffoldState extends State<OrderMobileScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar,
      backgroundColor: MyDefaultBackround,
      drawer: buildDrawer(context)
    );
  }
}