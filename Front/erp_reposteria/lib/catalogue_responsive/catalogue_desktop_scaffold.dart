import 'package:erp_reposteria/constants.dart';
import 'package:erp_reposteria/util/catalog.dart';
import 'package:erp_reposteria/util/my_product_tile.dart';
import 'package:flutter/material.dart';

class CatalogueDesktopScaffold extends StatefulWidget {
  const CatalogueDesktopScaffold({super.key});

  @override
  State<CatalogueDesktopScaffold> createState() => _CatalogueDesktopScaffoldState();
}

class _CatalogueDesktopScaffoldState extends State<CatalogueDesktopScaffold> {

  final Catalog _catalog = Catalog();

  @override
  Widget build(BuildContext context) {

    final products = _catalog.catalog;

    return Scaffold(
      appBar: MyAppBar,
      backgroundColor: MyDefaultBackround,
      drawer: buildDrawer(context),

      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return MyProductTile(product: product);
              },
            ),
          ),
          const SizedBox(height: 20,),
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 164, 31, 53),
                foregroundColor: Colors.white,
              ),
              child: const Text('Regresar'),
            ),

            const SizedBox(height: 20,),
        ],
      ),

    );
  }
}