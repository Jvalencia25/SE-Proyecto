import 'package:erp_reposteria/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderDesktopScaffold extends StatefulWidget {
  OrderDesktopScaffold({super.key});

  final cantidadController = TextEditingController();
  final nombreController = TextEditingController();
  final direccionController = TextEditingController();

  @override
  State<OrderDesktopScaffold> createState() => _OrderDesktopScaffoldState();
}

class _OrderDesktopScaffoldState extends State<OrderDesktopScaffold> {

  _OrderDesktopScaffoldState(){
    _selectedProductoVal = _productosList[0];
    _selectedVendedorVal = _vendedoresList[0];
  }

  //variables
    final _productosList = ["Item 1", "Item 2", "Item 3"];
    final _vendedoresList = ["Vendedor 1", "Vendedor 2", "Vendedor 3"];
    String? _selectedProductoVal = "";
    String? _selectedVendedorVal = "";

    get cantidadController => null;
    get nombreController => null;
    get direccionController => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar,
      backgroundColor: MyDefaultBackround,
      drawer: buildDrawer(context),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          
          //Gestión de pedidos + regresar
          Align(
            alignment: const AlignmentDirectional(-1, 0),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Gestión de pedidos',
                    style: GoogleFonts.abrilFatface(),
                    textScaler: const TextScaler.linear(3),
                    ),
                  const SizedBox(width: 60),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 164, 31, 53),
                      foregroundColor: Colors.white
                    ),
                    child: const Text(
                    'Regresar',
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          //Registro de venta
          Padding(
            padding: const EdgeInsets.all(24),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  'Registro de venta',
                  style: GoogleFonts.average(color: const Color.fromARGB(255, 164, 31, 53),),
                  textScaler: const TextScaler.linear(2),
                  )
              ],
            ),
            ),

          
          //Seleccionar suministro
          Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [

                  Text(
                    'Producto',
                    style: GoogleFonts.average(),
                    textScaler: const TextScaler.linear(1.2),
                    ),

                  const SizedBox(width: 20),

                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: const Offset(0, 1)
                        )
                      ]
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        value: _selectedProductoVal,
                        items: _productosList.map(
                          (e){
                            return DropdownMenuItem(child: Text(e), value: e);
                          }
                        ).toList(),
                        onChanged: (val){
                          setState(() {
                            _selectedProductoVal = val as String;
                          });
                        },
                        hint: const Text('Nombre del producto'),
                        icon: const Icon(Icons.keyboard_arrow_down_rounded),
                        borderRadius: BorderRadius.circular(8),
                        alignment: Alignment.center,
                        style: GoogleFonts.average(), 
                      
                      ),
                    ),
                  ),

                ],
              ),
            ),

          //cantidad
          Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(24, 24, 24, 24),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Cantidad',
                    style: GoogleFonts.average(),
                    textScaler: const TextScaler.linear(1.2),
                    ),

                  const SizedBox(width: 20),

                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: const Offset(0, 1)
                        )
                      ]
                    ),
                      child: TextField(
                        controller: cantidadController,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          hintText: 'Cantidad ingresada',
                          hintStyle: GoogleFonts.average(),
                          border: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                          )
                        ),
                      ),
                    ),
                  )

                  

                ],
              ),
            ),
        
          //Agregar a la lista -> falta implementar botón 
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 24),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 164, 31, 53),
                      foregroundColor: Colors.white
                    ), 
                    child: const Text(
                    'Agregar a la lista',
                    ),
                  ),
              ],
            ),
          ),

          //Seleccionar vendedor
          Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [

                  Text(
                    'Vendedor',
                    style: GoogleFonts.average(),
                    textScaler: const TextScaler.linear(1.2),
                    ),

                  const SizedBox(width: 20),

                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: const Offset(0, 1)
                        )
                      ]
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        value: _selectedVendedorVal,
                        items: _vendedoresList.map(
                          (e){
                            return DropdownMenuItem(child: Text(e), value: e);
                          }
                        ).toList(),
                        onChanged: (val){
                          setState(() {
                            _selectedVendedorVal = val as String;
                          });
                        },
                        hint: const Text('Nombre del producto'),
                        icon: const Icon(Icons.keyboard_arrow_down_rounded),
                        borderRadius: BorderRadius.circular(8),
                        alignment: Alignment.center,
                        style: GoogleFonts.average(), 
                      
                      ),
                    ),
                  ),

                ],
              ),
            ),

          //Nombre cliente
          Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(24, 24, 24, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Nombre Cliente',
                    style: GoogleFonts.average(),
                    textScaler: const TextScaler.linear(1.2),
                    ),

                  const SizedBox(width: 20),

                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: const Offset(0, 1)
                        )
                      ]
                    ),
                      child: TextField(
                        controller: nombreController,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          hintText: 'Nombre del cliente',
                          hintStyle: GoogleFonts.average(),
                          border: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                          )
                        ),
                      ),
                    ),
                  )

                  

                ],
              ),
            ),
        
          //Dirección cliente
          Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(24, 24, 24, 24),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Dirección Cliente',
                    style: GoogleFonts.average(),
                    textScaler: const TextScaler.linear(1.2),
                    ),

                  const SizedBox(width: 20),

                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: const Offset(0, 1)
                        )
                      ]
                    ),
                      child: TextField(
                        controller: direccionController,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          hintText: 'Dirección del cliente',
                          hintStyle: GoogleFonts.average(),
                          border: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                          )
                        ),
                      ),
                    ),
                  )

                  

                ],
              ),
            ),
        
          //Aceptar-> falta implementar botón 
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 24),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 164, 31, 53),
                      foregroundColor: Colors.white
                    ), 
                    child: const Text(
                    'Aceptar',
                    ),
                  ),
              ],
            ),
          ),

        ],
      ),
      
    );
  }
}