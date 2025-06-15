import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Buttonlanguage extends StatelessWidget {
  final String language;
  final void Function()? onPressed;
  const Buttonlanguage({super.key, required this.language, this.onPressed});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: MaterialButton(
        onPressed:onPressed ,
        color: Colors.blue,
        textColor: Colors.white,
        minWidth: 200,
        height: 50,
        child: Text(language),
      ),
    );
  }
}
