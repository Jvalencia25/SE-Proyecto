import 'package:flutter/material.dart';

var MyDefaultBackround = Colors.grey[300];

var MyAppBar = AppBar(
        backgroundColor: Colors.grey[600],
        shadowColor: Colors.grey,
        elevation: 2,
);

var MyDrawer = Drawer(
        backgroundColor: Colors.grey[300],
        shadowColor: Colors.grey,
        elevation: 4,
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