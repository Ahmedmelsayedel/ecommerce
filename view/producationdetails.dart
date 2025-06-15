import 'package:ecommerce/controller/productdetailscontrller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/data/model/pagemodel.dart';

import 'package:ecommerce/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Producationdetails extends StatelessWidget {
  const Producationdetails({super.key});

  @override
  Widget build(BuildContext context) {
    Productdetailscontrllerimp controller =
        Get.put(Productdetailscontrllerimp());

    return Scaffold(
        bottomNavigationBar: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: MaterialButton(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              onPressed: () {
                controller.gotocart();
                controller.selectcart();
              },
              color: Colors.blue,
              child: const Text(
                "Go to cart",
                style: TextStyle(color: Colors.white),
              ),
            )),
        body: GetBuilder<Productdetailscontrllerimp>(
          builder: (controller) => Handlingdataview(
            statesrequest: controller.statesrequest,
            widget: ListView(
              children: [
                Container(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: 250,
                          child: Image.network(
                            "${Apidata.imageitem}/${controller.itemModel.itemImage}.png",
                          ),
                        ),
                        Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "${controller.itemModel.itemNameEn}",
                              style: const TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            )),
                        Column(
                          children: [
                            Container(
                                alignment: Alignment.centerLeft,
                                child: Row(
                                  children: [
                                    const Text(
                                      "price :",
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "${controller.itemModel.itemPrice}\$",
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.red),
                                    ),
                                  ],
                                )),
                            SizedBox(
                              width: 15,
                            ),
                            Container(
                                alignment: Alignment.centerLeft,
                                child: Row(
                                  children: [
                                    const Text(
                                      "price after discount :",
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "${controller.itemModel.priceDiscount}\$",
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.red),
                                    ),
                                  ],
                                )),
                          ],
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            "Color ",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Row(
                          children: [
                            ...List.generate(
                              controller.itemcolor.length,
                              (index) => Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.all(10),
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                    color: controller.itemcolor[index]
                                                ["color"] ==
                                            controller.itemModel.itemDescEn
                                        ? Color.fromARGB(255, 13, 54, 236)
                                        : null,
                                    border: Border.all(color: Colors.black)),
                                child: Text(
                                  "${controller.itemcolor[index]["color"]}",
                                  style: TextStyle(
                                    color: controller.itemcolor[index]
                                                ["color"] ==
                                            controller.itemModel.itemDescEn
                                        ? const Color.fromARGB(
                                            255, 232, 232, 235)
                                        : null,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  controller
                                      .insertdata(controller.itemModel.itemId!);
                                },
                                icon: Icon(Icons.add)),
                            Container(
                              height: 30,
                              width: 50,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black)),
                              child: Text(
                                "${controller.cartcout}",
                                textAlign: TextAlign.center,
                              ),
                            ),
                            IconButton(
                                onPressed: () {
                                  controller
                                      .removecart(controller.itemModel.itemId!);
                                },
                                icon: Icon(Icons.remove))
                          ],
                        )
                      ],
                    )),
              ],
            ),
          ),
        ));
  }
}
