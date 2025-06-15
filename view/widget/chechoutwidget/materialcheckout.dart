import 'package:flutter/material.dart';

class Materialcheckout extends StatelessWidget {
  final String title;
  final bool isactive;
  final void Function()? onPressed;
  const Materialcheckout(
      {super.key, required this.title, required this.isactive, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: MaterialButton(
        textColor: Colors.white,
        onPressed:onPressed,
        color: isactive == true ? Colors.green : Colors.blue,
        child: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
    );
  }
}
