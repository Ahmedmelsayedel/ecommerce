import 'package:ecommerce/controller/orderarchivecontrller.dart';
import 'package:ecommerce/controller/ordercontroller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/data/model/ordermodel.dart';
import 'package:ecommerce/veiw/orderdetails.dart';
import 'package:ecommerce/veiw/wedgit/ratingdialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:jiffy/jiffy.dart';

class Orderarchiveh extends StatelessWidget {
  const Orderarchiveh({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Orderarchivecontrller());
    return GetBuilder<Orderarchivecontrller>(
        builder: (controller) => Handlingdataview(
            statesrequest: controller.statesrequest,
            widget: Scaffold(
                body: Container(
              padding: const EdgeInsets.all(12),
              child: ListView.builder(
                itemCount: controller.data.length,
                itemBuilder: (context, index) {
                  return Detailsarchive(controller.data[index]);
                },
              ),
            ))));
  }
}

class Detailsarchive extends GetView<Orderarchivecontrller> {
  final OrederModel orederModel;
  const Detailsarchive(this.orederModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 40,
        ),
        Row(children: [
          Text("your order is number:${orederModel.ordreId}",
              style:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Spacer(),
          Text("${Jiffy.parse('${orederModel.orderData}').fromNow()}")
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
          "coupon :${controller.couponstatus1(orederModel.orderCoupon!)}",
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
            MaterialButton(
              onPressed: () {
                showdialog(context);
              },
              child: Text("Rating"),
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
