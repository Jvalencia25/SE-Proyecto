import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: non_constant_identifier_names
var MyDefaultBackround = const Color.fromARGB(255, 242, 241, 209);

// ignore: non_constant_identifier_names
var MyAppBar = AppBar(
        backgroundColor: const Color.fromARGB(255, 242, 241, 209),
        title: Text('La Dolce Vita', style: GoogleFonts.abrilFatface()),
        titleTextStyle: const TextStyle(
          color: Color.fromARGB(255, 164, 31, 53),
          fontSize: 25,
        ),
        shadowColor: Colors.grey,
        elevation: 1,
);


Widget buildDrawer(BuildContext context) {
  return Drawer(
    backgroundColor: Color.fromARGB(255, 242, 241, 209),
    shadowColor: Colors.grey,
    elevation: 4,
    child: Column(
      children: [
        DrawerHeader(child: Icon(Icons.favorite)),
        ListTile(
          leading: Icon(Icons.account_circle_rounded),
          title: Text('Usuario'),
          textColor: Color.fromARGB(255, 164, 31, 53),
          iconColor: Color.fromARGB(255, 164, 31, 53),
          onTap: () {
            // Aquí puedes manejar la navegación o cualquier acción usando context
            Navigator.of(context).pushNamed('/usuario');
          },
        ),
        ListTile(
          leading: Icon(Icons.business),
          title: Text('Sobre la empresa'),
          textColor: Color.fromARGB(255, 164, 31, 53),
          iconColor: Color.fromARGB(255, 164, 31, 53),
          onTap: () {
            // Aquí puedes manejar la navegación o cualquier acción usando context
            Navigator.of(context).pushNamed('/empresa');
          },
        ),
        ListTile(
          leading: Icon(Icons.article_rounded),
          title: Text('Sobre el proyecto'),
          textColor: Color.fromARGB(255, 164, 31, 53),
          iconColor: Color.fromARGB(255, 164, 31, 53),
          onTap: () {
            // Aquí puedes manejar la navegación o cualquier acción usando context
            Navigator.of(context).pushNamed('/proyecto');
          },
        ),
        Spacer(),
        ListTile(
          leading: Icon(Icons.exit_to_app),
          title: Text('Salir'),
          textColor: Color.fromARGB(255, 164, 31, 53),
          iconColor: Color.fromARGB(255, 164, 31, 53),
          onTap: () {
            // Aquí puedes manejar la navegación o cualquier acción usando context
            Navigator.of(context).pop();
          },
        ),
      ],
    ),
  );
}

// ignore: non_constant_identifier_names
// var MyDrawer = const Drawer(
//         backgroundColor: Color.fromARGB(255, 242, 241, 209),
//         shadowColor: Colors.grey,
//         elevation: 4,
//         child: Column(children: [
//           DrawerHeader(child: Icon(Icons.favorite)),
//           ListTile(
//             leading: Icon(Icons.account_circle_rounded),
//             title: Text('Usuario'),
//             textColor: Color.fromARGB(255, 164, 31, 53),
//             iconColor: Color.fromARGB(255, 164, 31, 53),
//           ),
//           ListTile(
//             leading: Icon(Icons.business),
//             title: Text('Sobre la empresa'),
//             textColor: Color.fromARGB(255, 164, 31, 53),
//             iconColor: Color.fromARGB(255, 164, 31, 53),
//           ),
//           ListTile(
//             leading: Icon(Icons.article_rounded),
//             title: Text('Sobre el proyecto'),
//             textColor: Color.fromARGB(255, 164, 31, 53),
//             iconColor: Color.fromARGB(255, 164, 31, 53),
//           ),
//           Spacer(),
//           ListTile(
//             leading: Icon(Icons.exit_to_app),
//             title: Text('Salir'),
//             textColor: Color.fromARGB(255, 164, 31, 53),
//             iconColor: Color.fromARGB(255, 164, 31, 53),
//           )
//         ],),
//       );