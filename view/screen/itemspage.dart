import 'package:ecommerce/controller/favouritecontroller.dart';
import 'package:ecommerce/controller/itemcontroller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/data/model/itemmodle.dart';
import 'package:ecommerce/data/model/pagemodel.dart';

import 'package:ecommerce/veiw/wedgit/home/appbarhome.dart';
import 'package:ecommerce/veiw/wedgit/home/catagriesitem.dart';
import 'package:ecommerce/veiw/wedgit/home/itemwidget.dart';
import 'package:ecommerce/veiw/wedgit/home/producation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Itemspage extends StatelessWidget {
  const Itemspage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Itemcontrollerimp());
    Favouritecontroller controllerfav = Get.put(Favouritecontroller());
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.all(10),
      child: GetBuilder<Itemcontrollerimp>(
        builder: (controller) {
          return Handlingdataview(
              statesrequest: controller.statesrequest,
              widget: ListView(
                children: [
                  Appbarhome(
                    onPressedsearch: () {
                      controller.searchactive();
                    },
                    onChanged: (val) {
                      controller.searchoff(val);
                    },
                    mycontroller: controller.search,
                    hinttext: "Search Product",
                    onpressedfavourite: () {
                      Get.toNamed(Appdata.favouritepage);
                      controllerfav.getfav();
                    },
                  ),
      controller.issearch==false?       ListView(shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
                children: [
                    const Catagiresitems(),
                  const Producation(title: "Producations"),
                  GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: controller.data.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 0.8),
                    itemBuilder: (BuildContext context, index) {
                      if (controller.data.isNotEmpty) {
                        controllerfav.isfavourite[controller.data[index]
                            ["item_id"]] = controller.data[index]["favourite"];
                        return Itemwidget(
                            itemModel:
                                ItemModel.fromJson(controller.data[index]));
                      } else {
                        // Handle the case when the list is empty
                        return const Text('No items available');
                      }
                    },
                  )
              ],):GridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: controller.listdata.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2, childAspectRatio: 0.8),
                            itemBuilder: (BuildContext context, index) {
                              return Itemwidget(
                                  itemModel: controller.listdata[index]);
                            },
                          )
                ],
              ));
        },
      ),
    ));
  }
}
