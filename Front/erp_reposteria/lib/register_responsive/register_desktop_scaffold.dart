import 'package:erp_reposteria/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterDesktopScaffold extends StatefulWidget {
  RegisterDesktopScaffold({super.key});

  final nombreController = TextEditingController();
  final correoController = TextEditingController();
  final contrasenaController = TextEditingController();
  

  @override
  State<RegisterDesktopScaffold> createState() => _RegisterDesktopScaffoldState();
}

class _RegisterDesktopScaffoldState extends State<RegisterDesktopScaffold> {

  _RegisterDesktopScaffoldState(){
    _selectedPermisoVal = _permisosList[0];
  }

  //variables
  final _permisosList = ["Usuario", "Administrador"];
  String? _selectedPermisoVal = "";
  
  get nombreController => null;
  get correoController => null;
  get contrasenaController => null;

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
        
            //inventario + regresar
            Align(
              alignment: const AlignmentDirectional(-1, 0),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Registro de usuarios',
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
        
            //Agregar nuevo usuario
            Padding(
              padding: const EdgeInsets.all(24),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'Agregar nuevo usuario',
                    style: GoogleFonts.average(color: const Color.fromARGB(255, 164, 31, 53),),
                    textScaler: const TextScaler.linear(2),
                    )
                ],
              ),
              ),
        
            //Seleccionar nivel de permisos
            Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
        
                    Text(
                      'Nivel de permisos',
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
                          value: _selectedPermisoVal,
                          items: _permisosList.map(
                            (e){
                              return DropdownMenuItem(child: Text(e), value: e);
                            }
                          ).toList(),
                          onChanged: (val){
                            setState(() {
                              _selectedPermisoVal = val as String;
                            });
                          },
                          hint: const Text('Nivel de permisos'),
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
        
            //Nombre
            Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(24, 24, 24, 24),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Nombre',
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
                            hintText: 'Nombre completo',
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
        
            //Correo
            Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 24),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Correo electrónico',
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
                          controller: correoController,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            hintText: 'Correo del usuario',
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
        
            //Contraseña
            Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 24),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Contraseña',
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
                          controller: contrasenaController,
                          textAlign: TextAlign.center,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: 'Contraseña del usuario',
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
        
            const SizedBox(height: 20),
        
            //Aceptar -> falta implementar botón 
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 24),
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
                        DataColumn(label: Text('Permisos')),
                        DataColumn(label: Text('Nombnre')),
                        DataColumn(label: Text('correo')),
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
      'permisos': 'Administrador',
      'nombre': 'Jerónimo Valencia Ospina',
      'correo': '@tumama.com',
    },
    {
      'permisos': 'Administrador',
      'nombre': 'Valeria',
      'correo': '@apartadó.com',
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
        DataCell(Text(item['permisos'])),
        DataCell(Text(item['nombre'])),
        DataCell(Text(item['correo'])),
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