import 'package:ecommerce/controller/favouritecontroller.dart';
import 'package:ecommerce/controller/itemcontroller.dart';
import 'package:ecommerce/core/constant/imageasset.dart';

import 'package:ecommerce/data/model/itemmodle.dart';
import 'package:ecommerce/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Itemwidget extends GetView<Itemcontrollerimp> {
  final ItemModel itemModel;
  const Itemwidget({super.key, required this.itemModel});

  @override
  Widget build(BuildContext context) {
    Get.put(Itemcontrollerimp());

    return InkWell(
        onTap: () {
          controller.gotoproduction(itemModel);
        },
        child: Stack(children: [
          Card(
            child: Column(
              children: [
                (
                  "${Apidata.imageitem}/${itemModel.itemImage}.png",
                  height: 130,
                  width: 150,
                ),
                Row(
                  children: [
                    const Text(
                      "Rating",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                    ...List.generate(
                        5,
                        (index) => const Icon(
                              Icons.star,
                              size: 12,
                            ))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${itemModel.priceDiscount}\$",
                      style: const TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold),
                    ),
                    GetBuilder<Favouritecontroller>(
                        builder: (controller) => IconButton(
                              onPressed: () {
                                if (controller.isfavourite[itemModel.itemId] ==
                                    1) {
                                  controller.setfavourite(itemModel.itemId, 0);
                                  controller.deletefavourit(itemModel.itemId!);
                                } else {
                                  controller.setfavourite(itemModel.itemId, 1);
                                  controller.insertfavourit(itemModel.itemId!);
                                  print(controller.isfavourite);
                                }
                              },
                              icon: Icon(
                                  controller.isfavourite[itemModel.itemId] == 1
                                      ? Icons.favorite
                                      : Icons.favorite_outline),
                              color: Colors.red,
                            ))
                  ],
                )
              ],
            ),
          ),
          if(itemModel.itemDiscount!=0)
              Positioned(
              top: 0,
              left: -10,
              child: Image.asset(
                "asset/image/discount.png",
                height: 90,
                width: 90,
              ))
          
      
        ]));
  }
}
