import 'package:flutter/material.dart';
class MyBox extends StatelessWidget {
  const MyBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: const Color.fromARGB(255, 164, 31, 53),
                ),
            );
  }
}