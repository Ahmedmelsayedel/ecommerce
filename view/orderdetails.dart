import 'package:ecommerce/controller/ordercontroller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/data/model/ordermodel.dart';
import 'package:ecommerce/data/model/pagemodel.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class Orderdetails extends StatelessWidget {
  const Orderdetails({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Ordercontroller());
    // TODO: implement build
    return GetBuilder<Ordercontroller>(
        builder: (controller) => Handlingdataview(
            statesrequest: controller.statesrequest,
            widget: Scaffold(
                body: Container(
              padding: const EdgeInsets.all(12),
              child: ListView.builder(
                itemCount: controller.data.length,
                itemBuilder: (context, index) {
                  return Details(controller.data[index]);
                },
              ),
            ))));
  }
}

class Details extends GetView<Ordercontroller> {
  final OrederModel orederModel;
  const Details(this.orederModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 40,
        ),
       
          Text("${Jiffy.parse('${orederModel.orderData}').fromNow()}"),
        Row(children: [
          Text("your order is number:${orederModel.ordreId}",
              style:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
         
        ]),
        Text(
          "price :${orederModel.orderPrice}",
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Text(
          "way to payment :${orederModel.paymentmethod}",
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Text(
          "delevery price :${orederModel.orderDeleveryprice}",
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Text(
          "coupon :${controller.couponstatus(orederModel.orderCoupon!)}",
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const Divider(),
        Row(
          children: [
            Text(
              "total price :${orederModel.orderTotal}",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Spacer(),
            if (orederModel.orderStatus == 0)
              MaterialButton(
                onPressed: () {
                  controller.deleteorder(orederModel.ordreId!);
                },
                child: Text("Delete order"),
                color: Colors.blue,
              )
          ],
        ),
        Text(
          "status order :${controller.printorderstatus(orederModel.orderStatus!)}",
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
