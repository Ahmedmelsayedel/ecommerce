import 'package:flutter/material.dart';

class Adresscheckout extends StatelessWidget {
  final String title;
  const Adresscheckout({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Text(
      title,
      style: (const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
    );
  }
}
