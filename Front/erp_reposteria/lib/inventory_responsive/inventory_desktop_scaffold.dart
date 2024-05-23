import 'package:erp_reposteria/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class InventoryDesktopScaffold extends StatefulWidget {
  const InventoryDesktopScaffold({super.key});

  @override
  State<InventoryDesktopScaffold> createState() => _InventoryDesktopScaffoldState();
}

class _InventoryDesktopScaffoldState extends State<InventoryDesktopScaffold> {

  _InventoryDesktopScaffoldState(){
    _selectedVal = _suministrosList[0];
  }
  
  //variables

  final _suministrosList = ["Item 1", "Item 2", "Item 3"];
  String? _selectedVal = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: MyAppBar,
      backgroundColor: MyDefaultBackround,
      drawer: buildDrawer(context),

      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Align(
            alignment: const AlignmentDirectional(-1, 0),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Inventario',
                    style: GoogleFonts.average(),
                    textScaler: const TextScaler.linear(1.2),
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
          Padding(
            padding: const EdgeInsets.all(24),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  'Agregar nuevo registro',
                  style: GoogleFonts.average(),
                  textScaler: const TextScaler.linear(1.2),
                  )
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

                  DropdownButton(
                    value: _selectedVal,
                    items: _suministrosList.map(
                      (e){
                        return DropdownMenuItem(child: Text(e), value: e);
                      }
                    ).toList(),
                    onChanged: (val){
                      setState(() {
                        _selectedVal = val as String;
                      });
                    },

                  ),

                ],
              ),
            )
        ],
      ),
    );
  }
}