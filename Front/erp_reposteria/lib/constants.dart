import 'package:flutter/material.dart';

var MyDefaultBackround = Color.fromARGB(255, 241, 240, 205);

var MyAppBar = AppBar(
        backgroundColor: Colors.brown,
);

var MyDrawer = Drawer(
        backgroundColor: Colors.blueAccent,
        child: Column(children: [
          DrawerHeader(child: Icon(Icons.local_restaurant)),
          ListTile(
            leading: Icon(Icons.account_circle_rounded),
            title: Text('Usuario'),
          ),
          ListTile(
            leading: Icon(Icons.business),
            title: Text('Sobre la empresa'),
          ),
          ListTile(
            leading: Icon(Icons.article_rounded),
            title: Text('Sobre el proyecto'),
          ),
        ],),
      );