import 'package:erp_reposteria/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutpjMobileScaffold extends StatefulWidget {
  const AboutpjMobileScaffold({super.key});

  @override
  State<AboutpjMobileScaffold> createState() => _AboutpjMobileScaffoldState();
}

class _AboutpjMobileScaffoldState extends State<AboutpjMobileScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyStartAppBar(context),
      backgroundColor: MyDefaultBackround,

      body: 
      Expanded(
        child: Row(children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(75.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                
                children: [
                  const Padding(padding: EdgeInsets.symmetric(horizontal: 1000)),
                  const SizedBox(height: 50),
        
                  Text(
                    'Proyecto para Sistemas Empresariales', 
                    textAlign: TextAlign.left,  
                    style: GoogleFonts.abrilFatface(),
                    textScaler: const TextScaler.linear(1.5),
                    ),
        
                  const SizedBox(height: 20),
        
                  Text(
                    'Por:', 
                    style: GoogleFonts.average(),
                    textScaler: const TextScaler.linear(1),
                    ),
                    Text(
                    'Valeria Espinal Alcaraz', 
                    style: GoogleFonts.average(),
                    textScaler: const TextScaler.linear(1),
                    ),
                    Text(
                    'Andrés Echeverri Amaya', 
                    style: GoogleFonts.average(),
                    textScaler: const TextScaler.linear(1),
                    ),
                    Text(
                    'Natalia Arboleda Arboleda', 
                    style: GoogleFonts.average(),
                    textScaler: const TextScaler.linear(1),
                    ),
                    Text(
                    'Jerónimo Valencia Ospina', 
                    style: GoogleFonts.average(),
                    textScaler: const TextScaler.linear(1),
                    ),
        
                  const SizedBox(height: 50),
        
                  Text(
                    'Universidad Pontificia Bolivariana', 
                    style: GoogleFonts.average(),
                    textScaler: const TextScaler.linear(1),
                    ),
        
                  Text(
                    '04/05/2024', 
                    style: GoogleFonts.average(),
                    textScaler: const TextScaler.linear(1),
                    ),
        
                  const SizedBox(height: 50),
        
                  Text(
                    'Frameworks utilizados:', 
                    style: GoogleFonts.average(),
                    textScaler: const TextScaler.linear(1),
                    ),
        
                    Text(
                    'Flutter', 
                    style: GoogleFonts.average(),
                    textScaler: const TextScaler.linear(1),
                    ),
        
                    Text(
                    'SpringBoot', 
                    style: GoogleFonts.average(),
                    textScaler: const TextScaler.linear(1),
                    ),
                    const SizedBox(height: 20),

                    ElevatedButton(
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 164, 31, 53),
                        foregroundColor: Colors.white
                      ),
                      child: const Text('Regresar')
                      ),


                  
                ],
              ),
            ),
          ),
          
        ],
        ),
      ),


    );
  }
}