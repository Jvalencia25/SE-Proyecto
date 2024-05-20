import 'package:erp_reposteria/constants.dart';
import 'package:erp_reposteria/user_responsive/user_desktop_scaffold.dart';
import 'package:erp_reposteria/user_responsive/user_mobile_scaffold.dart';
import 'package:erp_reposteria/user_responsive/user_responsive_layout.dart';
import 'package:erp_reposteria/user_responsive/user_tablet_scaffold.dart';
import 'package:erp_reposteria/util/my_button.dart';
import 'package:erp_reposteria/util/my_textfield.dart';
import 'package:flutter/material.dart';

class StartDesktopScaffold extends StatefulWidget {
  StartDesktopScaffold({super.key});

  //control de edición de texto
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final codeController = TextEditingController();

  @override
  State<StartDesktopScaffold> createState() => _StartDesktopScaffoldState();
}

class _StartDesktopScaffoldState extends State<StartDesktopScaffold> {
  get usernameController => null;
  get passwordController => null;
  get codeController => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyStartAppBar(context),
      backgroundColor: MyDefaultBackround,
      body: Column(
        children:  [
          //logo

        const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center, // Centra horizontalmente
            children: [
              Expanded(child: Container()), // Ocupa el espacio a la izquierda
              const Icon(Icons.verified_user_rounded, size: 50),
              Expanded(child: Container()), // Ocupa el espacio a la derecha
            ],
          ),
          const SizedBox(height: 50),

          //bienvenido de vuelta
          const Text(
            '¡Bienvenido de vuelta!', 
            style: TextStyle(
              color: Color.fromARGB(255, 164, 31, 53),
              fontSize: 16)),
              
          const SizedBox(height: 50),

          //correo
          MyTextfield(
            controller: usernameController,
            hintText: 'Correo electrónico',
            obscureText: false,
          ),
          const SizedBox(height: 20),

          //contraseña
          MyTextfield(
            controller: passwordController,
            hintText: 'Contraseña',
            obscureText: true,
          ),
          const SizedBox(height: 20),

          //código
          const Text(
            'Código suministrado por el administrador', 
            style: TextStyle(
              color: Color.fromARGB(255, 164, 31, 53),
              fontSize: 16)),

          const SizedBox(height: 20),
          MyTextfield(
            controller: codeController,
            hintText: 'Código',
            obscureText: true,
          ),
          const SizedBox(height: 50),

          //botón ingresar
          MyButton(
            onTap: () {
            // Al presionar el botón, nos lleva a la página de información sobre el proyecto
            Navigator.push(
              context, 
              MaterialPageRoute(
                builder: (context) => ResponsiveLayout(
                  mobileScaffold: const MobileScaffold(), 
                  tabletScaffold: const TabletScaffold(), 
                  desktopScaffold: const DesktopScaffold())));
          },
          ),

          const SizedBox(height: 50),

        ],
      )
    );
  }
}