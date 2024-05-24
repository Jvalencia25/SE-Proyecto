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

    final _dataSource = InventoryDataSource();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar,
      backgroundColor: MyDefaultBackround,
      drawer: buildDrawer(context),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
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
        

            //TABLA DE DATOS
            Center(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: PaginatedDataTable(
                    columns: const [
                      DataColumn(label: Text('Producto')),
                      DataColumn(label: Text('Cantidad')),
                      DataColumn(label: Text('Vendedor')),
                      DataColumn(label: Text('Nombre del Cliente')),
                      DataColumn(label: Text('Dirección del Cliente')),
                    ],
                    source: _dataSource,
                    rowsPerPage: 5,
                  ),
                ),
              ),
            ),
          
          ],
        ),
      ),
      
    );
  }
}

class InventoryDataSource extends DataTableSource {
  final List<Map<String, dynamic>> _data = [
    {
      'producto': 'Pasted de Queso',
      'cantidad': '10',
      'vendedor': 'Jerónimo Valencia Ospina',
      'nombreCliente': 'Doña Marina',
      'direccionCliente': 'La esquina de Don Miguel',
    },
    {
      'producto': 'Pie de Queso',
      'cantidad': '500',
      'vendedor': 'Jerónimo Valencia Ospina',
      'nombreCliente': 'Luz Dary',
      'direccionCliente': 'La esquina de Don Miguel',
    },
    // Estos datos son de ejemplo, ustedes añaden los que si son
  ];

  @override
  DataRow? getRow(int index) {
    if (index >= _data.length) return null;
    final item = _data[index];
    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(Text(item['producto'])),
        DataCell(Text(item['cantidad'])),
        DataCell(Text(item['vendedor'])),
        DataCell(Text(item['nombreCliente'])),
        DataCell(Text(item['direccionCliente'])),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _data.length;

  @override
  int get selectedRowCount => 0;
}