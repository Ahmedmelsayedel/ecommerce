import 'package:ecommerce/controller/cartcontroller.dart';
import 'package:ecommerce/controller/productdetailscontrller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/data/model/pagemodel.dart';

import 'package:ecommerce/veiw/wedgit/home/cartwedgit.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

class Cart extends StatelessWidget {
  const Cart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Cartcontroller cartcontroller = Get.put(Cartcontroller());
    return GetBuilder<Productdetailscontrllerimp>(
        builder: (controller) => Handlingdataview(
            statesrequest: controller.statesrequest,
            widget: Form(
                key: controller.formstate,
                child: Scaffold(
                  bottomNavigationBar: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Divider(),
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 2,
                                child: Container(
                                    child: TextFormField(
                                  controller: controller.name,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "enter coupon code";
                                    }
                                  },
                                  cursorHeight: 25,
                                  decoration: const InputDecoration(
                                    hintText: "coupon code",
                                    hintStyle:
                                        TextStyle(fontSize: 18, height: 1.75),
                                    fillColor:
                                        Color.fromARGB(255, 231, 240, 247),
                                    filled: true,
                                  ),
                                  style: const TextStyle(
                                      height: 1,
                                      fontSize: 20,
                                      fontWeight: FontWeight.normal),
                                ))),
                            const SizedBox(
                              width: 15,
                            ),
                            Expanded(
                                flex: 1,
                                child: MaterialButton(
                                  onPressed: () {
                                    controller.selectcoupon();
                                  },
                                  color: Colors.blue,
                                  child: const Text(
                                    "coupon",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ))
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 170,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Column(
                            children: [
                              const Text(
                                "Sub -total",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(" ${controller.totalcount}")
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                bottom: 10, right: 5, left: 15),
                            child: Text(
                              "${controller.totalpriceafterdiscount()}\$",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          )
                        ],
                      ),
                      MaterialButton(
                        onPressed: () {
                          controller.gotCheckout();
                        },
                        color: Colors.blue,
                        padding: const EdgeInsets.only(left: 10),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        minWidth: 170,
                        textColor: Colors.white,
                        child: const Text("Check Out "),
                      ),
                    ],
                  ),
                  body: ListView(
                    children: [
                      const Text(
                        "My Cart",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      ...List.generate(controller.data.length, (index) {
                        return Cartwedgit(
                          cartModel: controller.data[index],
                        );
                      })
                    ],
                  ),
                ))));
  }
}
