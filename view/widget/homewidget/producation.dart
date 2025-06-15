import 'package:flutter/material.dart';

class Producation extends StatelessWidget {
  final String title;
  const Producation({super.key, required this.title});

  @override
  Widget build(BuildContext context) {

    return Text(
      title,
      style: const TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 2, 73, 131)),
    );
  }
}
