import 'package:ecommerce/controller/adresscontroller.dart';
import 'package:ecommerce/controller/settingcontroller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/data/model/adressmodel.dart';
import 'package:ecommerce/data/model/pagemodel.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ViewAdress extends StatelessWidget {
  const ViewAdress({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Adresscontroller());
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: FloatingActionButton(
          onPressed: () {
            Get.toNamed(Appdata.addadress);
          },
          backgroundColor: Colors.blue,
          child: const Icon(Icons.add),
        ),
      ),
      body: GetBuilder<Adresscontroller>(
        builder: (controller) {
          return Handlingdataview(
            statesrequest: controller.statesrequest,
            widget: ListView.builder(
                itemCount: controller.data.length,
                itemBuilder: (context, index) {
                  return CartAdress(
                    adressModel: controller.data[index],
                  );
                }),
          );
        },
      ),
    );
  }
}

class CartAdress extends StatelessWidget {
  final AdressModel adressModel;
  const CartAdress({super.key, required this.adressModel});

  @override
  Widget build(BuildContext context) {
    Adresscontroller controller = Get.put(Adresscontroller());
    // TODO: implement build
    return InkWell(
      onTap: () {
        controller.gotoupdatadress();
      },
      child: Card(
        child: Column(
          children: [
            ListTile(
              title: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "City  : ",
                        style: TextStyle(fontSize: 25),
                      ),
                      Text(
                        "${adressModel.city}",
                        style: TextStyle(fontSize: 20),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        "Street  : ",
                        style: TextStyle(fontSize: 25),
                      ),
                      Text(
                        "${adressModel.street}",
                        style: const TextStyle(fontSize: 20),
                      )
                    ],
                  )
                ],
              ),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  controller.deleteadress(adressModel.adressid!);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
