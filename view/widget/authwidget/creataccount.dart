import 'package:flutter/material.dart';

class Creataccount extends StatelessWidget {
  final void Function()? onPressed;
  final String text1;
  final String text2;
  const Creataccount({super.key, this.onPressed, required this.text1, required this.text2});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      children: [
        Text(text1),
        TextButton(
            onPressed: onPressed,
            child: Text(
              text2,
              style:  const TextStyle(color: Colors.blue),
            ))
      ],
    );
  }
}
