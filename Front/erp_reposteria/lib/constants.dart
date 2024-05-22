import 'package:erp_reposteria/aboutbn_responsive/aboutbn_desktop_scaffold.dart';
import 'package:erp_reposteria/aboutbn_responsive/aboutbn_mobile_scaffold.dart';
import 'package:erp_reposteria/aboutbn_responsive/aboutbn_responsive_layout.dart';
import 'package:erp_reposteria/aboutbn_responsive/aboutbn_tablet_scaffold.dart';
import 'package:erp_reposteria/aboutpj_responsive/aboutpj_desktop_scaffold.dart';
import 'package:erp_reposteria/aboutpj_responsive/aboutpj_mobile_scaffold.dart';
import 'package:erp_reposteria/aboutpj_responsive/aboutpj_responsive_layout.dart';
import 'package:erp_reposteria/aboutpj_responsive/aboutpj_tablet_scaffold.dart';
import 'package:erp_reposteria/contact_responsive/contact_desktop_scaffold.dart';
import 'package:erp_reposteria/contact_responsive/contact_mobile_scaffold.dart';
import 'package:erp_reposteria/contact_responsive/contact_responsive_layout.dart';
import 'package:erp_reposteria/contact_responsive/contact_tablet_scaffold.dart';
import 'package:erp_reposteria/login_responsive/login_responsive_layout.dart';
import 'package:erp_reposteria/start_responsive/start_desktop_scaffold.dart';
import 'package:erp_reposteria/start_responsive/start_mobile_scaffold.dart';
import 'package:erp_reposteria/start_responsive/start_responsive_layout.dart';
import 'package:erp_reposteria/start_responsive/start_tablet_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: non_constant_identifier_names
var MyDefaultBackround = const Color.fromARGB(255, 242, 241, 209);

// ignore: non_constant_identifier_names
var MyAppBar = AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(255, 242, 241, 209),
        title: Text('La Dolce Vita', style: GoogleFonts.abrilFatface()),
        titleTextStyle: const TextStyle(
          color: Color.fromARGB(255, 164, 31, 53),
          fontSize: 25,
        ),
        shadowColor: Colors.grey,
        elevation: 1,
);

// ignore: non_constant_identifier_names
class MyStartAppBar extends AppBar {
  MyStartAppBar(BuildContext context, {super.key})
      : super(
        automaticallyImplyLeading: false,
          backgroundColor: const Color.fromARGB(255, 242, 241, 209),
          title: Text('La Dolce Vita', style: GoogleFonts.abrilFatface()),
          titleTextStyle: const TextStyle(
            color: Color.fromARGB(255, 164, 31, 53),
            fontSize: 25,
          ),
          shadowColor: Colors.grey,
          elevation: 1,
          actions: [
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AboutbnResponsiveLayout(
                          mobileScaffold: const AboutbnMobileScaffold(),
                          tabletScaffold: const AboutbnTabletScaffold(),
                          desktopScaffold: const AboutbnDesktopScaffold(),
                        )));
              },
              child: const Text('Sobre la empresa',
                  style: TextStyle(color: Color.fromARGB(255, 164, 31, 53))),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AboutpjResponsiveLayout(
                          mobileScaffold: const AboutpjMobileScaffold(),
                          tabletScaffold: const AboutpjTabletScaffold(),
                          desktopScaffold: const AboutpjDesktopScaffold(),
                        )));
              },
              child: const Text('Sobre el proyecto',
                  style: TextStyle(color: Color.fromARGB(255, 164, 31, 53))),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ContactResponsiveLayout(
                          mobileScaffold: const ContactMobileScaffold(),
                          tabletScaffold: const ContactTabletScaffold(),
                          desktopScaffold: const ContactDesktopScaffold(),
                        )));
              },
              child: const Text('Contacto',
                  style: TextStyle(color: Color.fromARGB(255, 164, 31, 53))),
            ),
          ],
        );
}


Widget buildDrawer(BuildContext context) {
  return Drawer(
    backgroundColor: Color.fromARGB(255, 242, 241, 209),
    shadowColor: Colors.grey,
    elevation: 4,
    child: Column(
      children: [
        const DrawerHeader(child: Icon(Icons.favorite)),
        ListTile(
          leading: Icon(Icons.business),
          title: Text('Sobre la empresa'),
          textColor: Color.fromARGB(255, 164, 31, 53),
          iconColor: Color.fromARGB(255, 164, 31, 53),
          onTap: () {
            // Al presionar el botón, nos lleva a la página de información sobre la empresa
            Navigator.push(context, MaterialPageRoute(builder: (context) => AboutbnResponsiveLayout(
              mobileScaffold: AboutbnMobileScaffold(),
              tabletScaffold: AboutbnTabletScaffold(),
              desktopScaffold: AboutbnDesktopScaffold(),
            )));
          },
        ),
        ListTile(
          leading: Icon(Icons.article_rounded),
          title: Text('Sobre el proyecto'),
          textColor: Color.fromARGB(255, 164, 31, 53),
          iconColor: Color.fromARGB(255, 164, 31, 53),
          onTap: () {
            // Al presionar el botón, nos lleva a la página de información sobre el proyecto
            Navigator.push(context, MaterialPageRoute(builder: (context) => AboutpjResponsiveLayout(
              mobileScaffold: AboutpjMobileScaffold(),
              tabletScaffold: AboutpjTabletScaffold(),
              desktopScaffold: AboutpjDesktopScaffold(),
            )));
          },
        ),
        Spacer(),
        ListTile(
          leading: Icon(Icons.exit_to_app),
          title: Text('Salir'),
          textColor: Color.fromARGB(255, 164, 31, 53),
          iconColor: Color.fromARGB(255, 164, 31, 53),
          onTap: () {
            // Al presionar el botón, nos devuelve al inicio
            Navigator.push(
              context, 
              MaterialPageRoute(
                builder: (context) => StartResponsiveLayout(
                  mobileScaffold: StartMobileScaffold(),
                  tabletScaffold: StartTabletScaffold(),
                  desktopScaffold: StartDesktopScaffold(),
                  )
                )
              );
          },
        ),
      ],
    ),
  );
}
