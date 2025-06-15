import 'package:ecommerce/controller/checkoutcontroller.dart';
import 'package:ecommerce/controller/productdetailscontrller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/veiw/wedgit/checkoutwidget/adresscheckout.dart';
import 'package:ecommerce/veiw/wedgit/checkoutwidget/cartcheckout.dart';
import 'package:ecommerce/veiw/wedgit/checkoutwidget/materialcheckout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Checkout extends StatelessWidget {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Checkoutcontroller());
   
    return GetBuilder<Checkoutcontroller>(
        builder: (controller) => Handlingdataview(
            statesrequest: controller.statesrequest,
            widget: Scaffold(
              bottomNavigationBar: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: MaterialButton(
                  onPressed: () {
                    
                    controller.checkouttoadress();
                   
                  },
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: const Text("confirm order"),
                ),
              ),
              body: Container(
                padding: const EdgeInsets.all(10),
                child: ListView(
                  children: [
                    const Adresscheckout(title: "Chose way to pay :"),
                    Materialcheckout(
                        onPressed: () {
                          controller.chosepayment("cash");
                        },
                        title: "By cash",
                        isactive: controller.payment == "cash" ? true : false),
                    Materialcheckout(
                        onPressed: () {
                          controller.chosepayment("payment");
                        },
                        title: "Payment cart",
                        isactive:
                            controller.payment == "payment" ? true : false),
                    const Adresscheckout(title: "Chose way to dlivery  :"),
                    Materialcheckout(
                        onPressed: () {
                          controller.chosedelivery("receive");
                        },
                        title: "Receive",
                        isactive:
                            controller.delivery == "receive" ? true : false),
                    Materialcheckout(
                        onPressed: () {
                          controller.chosedelivery("delevery");
                        },
                        title: "Delivery",
                        isactive:
                            controller.delivery == "delevery" ? true : false),
                    if (controller.delivery == "delevery")
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Adresscheckout(title: "Your adress  :"),
                          ...List.generate(
                            controller.datacheck.length,
                            (index) => Cartcheckout(
                                onTap: () {
                                  controller.chosepadress(
                                      controller.datacheck[index].adressid!);
                                },
                                title: "Address ${index + 1}",
                                subtitle:
                                    "City:${controller.datacheck[index].city} ,Street:${controller.datacheck[index].street}",
                                isactive: controller.adressid ==
                                        controller.datacheck[index].adressid
                                    ? true
                                    : false),
                          )
                        ],
                      )
                  ],
                ),
              ),
            )));
  }
}
