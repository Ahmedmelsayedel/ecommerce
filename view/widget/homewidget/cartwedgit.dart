import 'package:ecommerce/controller/cartcontroller.dart';
import 'package:ecommerce/controller/productdetailscontrller.dart';

import 'package:ecommerce/data/model/cartmodel.dart';
import 'package:ecommerce/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Cartwedgit extends StatelessWidget {
  final CartModel cartModel;
  const Cartwedgit({super.key, required this.cartModel});

  @override
  Widget build(BuildContext context) {
    Productdetailscontrllerimp procontroller =
        Get.put(Productdetailscontrllerimp());
    return (Container(
      padding: const EdgeInsets.only(top: 15),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Image.network(
                "${Apidata.imageitem}/${cartModel.itemImage}.png"),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
              flex: 4,
              child: Container(
                padding: const EdgeInsets.only(bottom: 16, top: 2),
                child: Text(
                  "${cartModel.itemNameEn}",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              )),

          ///    Expanded(
          //     flex: 1,
          //    child: Container(
          //     width: 15,
          //     decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(100),
          //        color: Colors.grey),
          //   child: IconButton(
          //     icon: const Icon(
          //      Icons.add,
          //    size: 15,
//),
          //  onPressed: () {
          //   procontroller.insertdata(cartModel.itemId!);
          //    procontroller.selectcart();
          //  },
          // ),
          // )),
          GetBuilder<Productdetailscontrllerimp>(
              builder: (procontroller) => Expanded(
                  flex: 1,
                  child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 9),
                      child: Text("${cartModel.cartcount}")))),
          // Expanded(
          //   flex: 1,
          //  child: Container(
          ///    decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(100),
          //       color: Colors.grey),
          //   child: IconButton(
          //    icon: const Icon(
          //   Icons.remove,
          //     size: 15,
          //   ),
          //   onPressed: () {
          //   procontroller.removecart(cartModel.itemId!);
          //    procontroller.selectcart();
          //  },
          //  ),
          // )),
          Expanded(
              flex: 3,
              child: Column(
                children: [
                  GetBuilder<Productdetailscontrllerimp>(
                      builder: (controller) => Text(
                            "${procontroller.itemModel.priceDiscount}\$",
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          )),
                  TextButton(
                      child: const Text(
                        "Remove",
                        style: TextStyle(color: Colors.red),
                      ),
                      onPressed: () {
                        procontroller.deletcart();
                      }),
                ],
              ))
        ],
      ),
    ));
  }
}
