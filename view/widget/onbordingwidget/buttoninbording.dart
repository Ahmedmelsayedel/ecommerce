import 'package:ecommerce/controller/onbordingconrtoller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Buttoninbording extends GetView<Onbordingcontrollerimp> {
  const Buttoninbording({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialButton(
        onPressed: () {
          controller.next();
        },
        child: Text("9".tr),
        color: Colors.blue,
        textColor: Colors.white,
        height: 50,
        minWidth: 200,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22.0),
        ));
  }
}
