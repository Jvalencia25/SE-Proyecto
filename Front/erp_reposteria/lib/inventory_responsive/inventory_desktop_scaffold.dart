import 'package:erp_reposteria/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class InventoryDesktopScaffold extends StatefulWidget {
  InventoryDesktopScaffold({super.key});

  final cantidadController = TextEditingController();
  final proveedorController = TextEditingController();

  @override
  State<InventoryDesktopScaffold> createState() => _InventoryDesktopScaffoldState();
}

class _InventoryDesktopScaffoldState extends State<InventoryDesktopScaffold> {

  _InventoryDesktopScaffoldState(){
    _selectedSuministroVal = _suministrosList[0];
    _selectedDiaVal = _diasList[0];
    _selectedMesVal = _mesList[0];
    _selectedAnoVal = _anoList[0];
  }
  
  //variables
  final _suministrosList = ["Item 1", "Item 2", "Item 3"];
  final _diasList = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31"];
  final _mesList = ["Enero","Febrero","Marzo","Abril","Mayo","Junio","Julio","Agosto","Septiembre","Octubre","Noviembre","Diciembre"];
  final _anoList = ["2024","2025","2026","2027","2028","2029","2030","2031","2032","2033","2034"];
  String? _selectedSuministroVal = "";
  String? _selectedDiaVal = "";
  String? _selectedMesVal = "";
  String? _selectedAnoVal = "";
  
  get cantidadController => null;
  get proveedorController => null;

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
      Padding(
        padding: const EdgeInsets.all(24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Inventario',
              style: GoogleFonts.abrilFatface(),
              textScaler: const TextScaler.linear(3),
            ),
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
          ],
        ),
      ),
      
      Padding(
        padding: const EdgeInsets.all(24),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              'Agregar nuevo registro',
              style: GoogleFonts.average(color: const Color.fromARGB(255, 164, 31, 53)),
              textScaler: const TextScaler.linear(2),
            ),
          ],
        ),
      ),
      
      Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Suministro',
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
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  value: _selectedSuministroVal,
                  items: _suministrosList.map((e) {
                    return DropdownMenuItem(child: Text(e), value: e);
                  }).toList(),
                  onChanged: (val) {
                    setState(() {
                      _selectedSuministroVal = val as String;
                    });
                  },
                  hint: const Text('Nombre del ingrediente'),
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
                      offset: const Offset(0, 1),
                    ),
                  ],
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
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      
      Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 24),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Proveedor',
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
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
                child: TextField(
                  controller: proveedorController,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: 'Nombre del proveedor',
                    hintStyle: GoogleFonts.average(),
                    border: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      
      Padding(
        padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Fecha de vencimiento',
              style: GoogleFonts.average(),
              textScaler: const TextScaler.linear(1.2),
            ),
            Text(
              'Día',
              style: GoogleFonts.average(),
              textScaler: const TextScaler.linear(1.2),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  value: _selectedDiaVal,
                  items: _diasList.map((e) {
                    return DropdownMenuItem(child: Text(e), value: e);
                  }).toList(),
                  onChanged: (val) {
                    setState(() {
                      _selectedDiaVal = val as String;
                    });
                  },
                  hint: const Text('Nombre del ingrediente'),
                  icon: const Icon(Icons.keyboard_arrow_down_rounded),
                  borderRadius: BorderRadius.circular(8),
                  alignment: Alignment.center,
                  style: GoogleFonts.average(),
                ),
              ),
            ),
            Text(
              'Mes',
              style: GoogleFonts.average(),
              textScaler: const TextScaler.linear(1.2),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  value: _selectedMesVal,
                  items: _mesList.map((e) {
                    return DropdownMenuItem(child: Text(e), value: e);
                  }).toList(),
                  onChanged: (val) {
                    setState(() {
                      _selectedMesVal = val as String;
                    });
                  },
                  hint: const Text('Nombre del ingrediente'),
                  icon: const Icon(Icons.keyboard_arrow_down_rounded),
                  borderRadius: BorderRadius.circular(8),
                  alignment: Alignment.center,
                  style: GoogleFonts.average(),
                ),
              ),
            ),
            Text(
              'Año',
              style: GoogleFonts.average(),
              textScaler: const TextScaler.linear(1.2),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  value: _selectedAnoVal,
                  items: _anoList.map((e) {
                    return DropdownMenuItem(child: Text(e), value: e);
                  }).toList(),
                  onChanged: (val) {
                    setState(() {
                      _selectedAnoVal = val as String;
                    });
                  },
                  hint: const Text('Nombre del ingrediente'),
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

      const SizedBox(height: 60),

      Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0, 24, 0, 24),
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
                foregroundColor: Colors.white,
              ), 
              child: const Text('Añadir al inventario'),
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
                DataColumn(label: Text('Suministro')),
                DataColumn(label: Text('Cantidad')),
                DataColumn(label: Text('Unidad de Medida')),
                DataColumn(label: Text('Proveedor')),
                DataColumn(label: Text('Fecha de Ingreso')),
                DataColumn(label: Text('Fecha de Vencimiento')),
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
      'suministro': 'Harina',
      'cantidad': '10',
      'unidadMedida': 'kg',
      'proveedor': 'Proveedor A',
      'fechaIngreso': '01/01/2024',
      'fechaVencimiento': '12/05/2024'
    },
    {
      'suministro': 'Azúcar',
      'cantidad': '5',
      'unidadMedida': 'kg',
      'proveedor': 'Proveedor B',
      'fechaIngreso': '01/01/2024',
      'fechaVencimiento': '15/06/2024'
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
        DataCell(Text(item['suministro'])),
        DataCell(Text(item['cantidad'])),
        DataCell(Text(item['unidadMedida'])),
        DataCell(Text(item['proveedor'])),
        DataCell(Text(item['fechaIngreso'])),
        DataCell(Text(item['fechaVencimiento'])),
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