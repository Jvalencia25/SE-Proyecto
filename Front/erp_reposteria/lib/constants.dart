import 'package:flutter/material.dart';

var MyDefaultBackround = Color.fromARGB(255, 241, 240, 205);

var MyAppBar = AppBar(
        backgroundColor: Colors.brown,
);

var MyDrawer = Drawer(
        backgroundColor: Colors.blueAccent,
        child: Column(children: [
          DrawerHeader(child: Icon(Icons.favorite_border_rounded)),
          ListTile(
            leading: Icon(Icons.inventory_2_rounded),
            title: Text('I N V E N T A R I O'),
          ),
          ListTile(
            leading: Icon(Icons.article),
            title: Text('C A T Á L O G O'),
          ),
          ListTile(
            leading: Icon(Icons.local_shipping_outlined),
            title: Text('P E D I D O S'),
          ),
          ListTile(
            leading: Icon(Icons.account_circle_rounded),
            title: Text('R E G I S T R O'),
          )
        ],),
      );