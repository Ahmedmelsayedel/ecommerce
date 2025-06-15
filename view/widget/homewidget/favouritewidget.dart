import 'package:ecommerce/controller/favouritecontroller.dart';
import 'package:ecommerce/data/model/favouritemodel.dart';

import 'package:ecommerce/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Favouritewidget extends GetView<Favouritecontroller> {
  final FavouriteModel itemModel;
  const Favouritewidget({super.key, required this.itemModel});

  @override
  Widget build(BuildContext context) {
    Get.put(Favouritecontroller());
    return InkWell(
      onTap: () {},
      child: Card(
        child: Column(
          children: [
            Image.network(
              "${Apidata.imageitem}/${itemModel.itemImage}.png",
              height: 130,
              width: 150,
            ),
            Row(
              children: [
                const Text(
                  "Rating",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
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
                  "${itemModel.itemPrice}\$",
                  style: const TextStyle(
                      color: Colors.red, fontWeight: FontWeight.bold),
                ),
                IconButton(
                    onPressed: () {
                      controller.deletfav(itemModel.favouriteId!);
                    },
                    icon: Icon(Icons.delete))
              ],
            )
          ],
        ),
      ),
    );
  }
}
