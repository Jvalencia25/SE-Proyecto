import 'package:flutter/material.dart';

class MyBox extends StatelessWidget {
  final String text;
  final String imageUrl;
  final VoidCallback onTap;

  const MyBox({
    Key? key,
    required this.text,
    required this.imageUrl,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          color: const Color.fromARGB(255, 164, 31, 53),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(imageUrl, height: 100, width: 100, fit: BoxFit.cover),
              SizedBox(height: 10),
              Text(
                text,
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}