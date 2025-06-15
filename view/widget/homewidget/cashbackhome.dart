import 'package:ecommerce/core/servces/servecis.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Cashbackhome extends StatelessWidget {
  final String title;
  const Cashbackhome({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    Myservecis myservecis = Get.find();

    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: const Color.fromARGB(227, 3, 140, 252),
        ),
        height: 100,
        child: Stack(
          children: [
            Text(
              title,
              style: const TextStyle(
                  height: 4,
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            Positioned(
                top: -30,
                right: myservecis.sharedPreferences.getString("lang") == "en"
                    ? -10
                    : null,
                left: myservecis.sharedPreferences.getString("lang") == "ar"
                    ? -10
                    : null,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: const Color.fromARGB(255, 4, 84, 150),
                  ),
                  height: 120,
                  width: 120,
                ))
          ],
        ));
  }
}
