import 'package:ecommerce/controller/testcontroller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

class Testveiw extends StatelessWidget {
  const Testveiw({super.key});

  @override
  Widget build(BuildContext context) {
 Get.put(Testcontroller());
    return Scaffold(
        appBar: AppBar(
          title: Text("test"),
        ),
        body: GetBuilder<Testcontroller>(
          builder: (controller) {
            return Handlingdataview(
                statesrequest: controller.statesrequest,
                widget: ListView.builder(
                    itemCount: controller.data.length,
                    itemBuilder: (context, index) {
                      return Text("${controller.data}");
                    }));
          },
        ));
  }
}
