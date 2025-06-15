import 'package:ecommerce/controller/homepagecontroller.dart';
import 'package:ecommerce/data/model/itemmodle.dart';
import 'package:ecommerce/linkapi.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class Producthome extends GetView<Homepagecontrollerimp> {
  const Producthome({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      height: 150,
      width: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: controller.items.length,
        itemBuilder: (context, index) {
          return Photoname(
              itemModel: ItemModel.fromJson(controller.items[index]));
        },
      ),
    );
  }
}

class Photoname extends GetView<Homepagecontrollerimp> {
  final ItemModel itemModel;
  const Photoname({super.key, required this.itemModel});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: () {
        controller.gotoprodicution(itemModel);
      },
      child: Container(
        padding: const EdgeInsets.all(2),
        height: 250,
        width: 170,
        child: Image.network("${Apidata.imageitem}/${itemModel.itemImage}.png"),
      ),
    );
  }
}
