import 'dart:io';

import 'package:ecommerce/controller/homescreencontroller.dart';
import 'package:ecommerce/controller/productdetailscontrller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/data/model/pagemodel.dart';

import 'package:ecommerce/veiw/wedgit/home/custommatrial.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Homescreencontrollerimp());

    // TODO: implement build
    return GetBuilder<Homescreencontrollerimp>(
        builder: (controller) => Scaffold(
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: FloatingActionButton(
              onPressed: () {},
              backgroundColor: Colors.blue,
              child: Icon(Icons.shopping_basket),
            ),
            bottomNavigationBar: BottomAppBar(
                shape: CircularNotchedRectangle(),
                notchMargin: 20,
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ...List.generate(controller.listpage.length + 1,
                          ((index) {
                        int i = index > 2 ? index - 1 : index;
                        return index == 2
                            ? Spacer()
                            : Custommatrial(
                                onPressed: () {
                                  controller.movepage(i);
                                },
                                text: controller.titleappbar[i],
                                iconData: controller.iconappbar[i],
                                active:
                                    controller.curentpage == i ? true : false,
                              );
                      }))
                    ])),
            body: WillPopScope(
              child: controller.listpage.elementAt(controller.curentpage),
              onWillPop: () {
                Get.defaultDialog(
                    title: "Exit",
                    middleText: "Are you sure",
                    cancel: ElevatedButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: Text("Cancel"),
                    ),
                    confirm: ElevatedButton(
                      onPressed: () {
                        exit(0);
                      },
                      child: Text("confirm"),
                    ));
                return Future.value(false);
              },
            )));
  }
}
