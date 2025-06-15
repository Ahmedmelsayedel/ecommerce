import 'package:ecommerce/controller/onbordingconrtoller.dart';
import 'package:ecommerce/data/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Controllerundrepage extends StatelessWidget {
  const Controllerundrepage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetBuilder<Onbordingcontrollerimp>(
        builder: (controller) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                    onbordingmodel.length,
                    (index) => AnimatedContainer(
                          duration: Duration(milliseconds: 900),
                          margin: EdgeInsets.only(top: 30, right: 17),
                          width: controller.currentindx == index ? 20 : 6,
                          height: 6,
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(10)),
                        ))
              ],
            ));
  }
}
