import 'package:erp_reposteria/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutbnTabletScaffold extends StatefulWidget {
  const AboutbnTabletScaffold({super.key});

  @override
  State<AboutbnTabletScaffold> createState() => _AboutbnTabletScaffoldState();
}

class _AboutbnTabletScaffoldState extends State<AboutbnTabletScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyStartAppBar(context),
      backgroundColor: MyDefaultBackround,

      body: 
      Row(children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.all(75.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              
              children: [
                const Padding(padding: EdgeInsets.symmetric(horizontal: 50)),
                //const SizedBox(height: 20),

                Text(
                  'Repostería La Dolce Vita', 
                  textAlign: TextAlign.left,  
                  style: GoogleFonts.abrilFatface(),
                  textScaler: const TextScaler.linear(1.5),
                  ),

                const SizedBox(height: 20),

                Text(
                  'En el corazón de Apartadó, Antioquia, Colombia, se encuentra un tesoro culinario que despierta los sentidos y deleita los paladares: La Dolce Vita, una encantadora repostería de renombre local. ', 
                  style: GoogleFonts.average(),
                  textScaler: const TextScaler.linear(.8),
                  ),

                  const SizedBox(height: 20),

                Text(
                  'Fundada como un sueño familiar, esta empresa se ha convertido en el epicentro de la dulzura en la región, ofreciendo una amplia gama de delicias horneadas que van desde pies dulces y salados, hasta tortas exquisitas, postres tentadores, panes recién horneados y una variedad de productos que enamoran a quienes tienen el placer de probarlos. ', 
                  style: GoogleFonts.average(),
                  textScaler: const TextScaler.linear(.8),
                  ),
                
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.all(35.0),
              child: Column(
                children: [
                  Expanded(
                    child: Image.network(
                      'https://i.imgur.com/0mJfQC8.jpeg',
                      fit: BoxFit.cover,
                      width: double.infinity,
                      alignment: Alignment.centerLeft,
                    ),   
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


    );
  }
}