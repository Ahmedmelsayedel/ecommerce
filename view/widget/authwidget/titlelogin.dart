import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Titlelogin extends StatelessWidget {
  const Titlelogin({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Row(
      children: [
        Text(
         "16".tr ,
          style: const TextStyle(
              color: Color.fromARGB(255, 3, 7, 231),
              fontSize: 30,
              fontWeight: FontWeight.bold),
        ),
        Text("17".tr,
            style: const TextStyle(
                color: Color.fromARGB(
                  255,
                  16,
                  192,
                  245,
                ),
                fontSize: 30,
                fontWeight: FontWeight.bold))
      ],
    );
  }
}
