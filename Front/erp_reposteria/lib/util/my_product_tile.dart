import 'package:erp_reposteria/util/products.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyProductTile extends StatelessWidget {

  final Product product;
  const MyProductTile({
    super.key,
    required this.product
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: 
      BoxDecoration(color: Color.fromARGB(255, 213, 213, 134),
      borderRadius: BorderRadius.circular(12)
      ),
      margin: const EdgeInsets.all(25),
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          //imagen del producto
          const Icon(Icons.restaurant_rounded),

          //nombre del producto
          Text(product.nombre, style: GoogleFonts.average(fontWeight: FontWeight.bold),),

          //descripción
          Text(product.descripcion, style: GoogleFonts.average(),),

          //categoría
          Text(product.categoria, style: GoogleFonts.average(),),

          //precio
          Text(product.precio, style: GoogleFonts.average(),),

          //ingredientes
          Text(product.ingredientes, style: GoogleFonts.average(),),
        ],
      ),
    );
  }
}