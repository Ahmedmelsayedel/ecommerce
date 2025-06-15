import 'package:ecommerce/controller/favouritecontroller.dart';
import 'package:ecommerce/controller/homepagecontroller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/data/model/itemmodle.dart';
import 'package:ecommerce/data/model/pagemodel.dart';

import 'package:ecommerce/veiw/wedgit/home/appbarhome.dart';
import 'package:ecommerce/veiw/wedgit/home/cashbackhome.dart';
import 'package:ecommerce/veiw/wedgit/home/catagireshome.dart';
import 'package:ecommerce/veiw/wedgit/home/itemwidget.dart';
import 'package:ecommerce/veiw/wedgit/home/producation.dart';
import 'package:ecommerce/veiw/wedgit/home/producthome.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
   Get.put(Homepagecontrollerimp());
    Favouritecontroller controllerfav = Get.put(Favouritecontroller());

    return GetBuilder<Homepagecontrollerimp>(
        builder: (controller) => Handlingdataview(
              statesrequest: controller.statesrequest,
              widget: Container(
                padding: const EdgeInsets.all(10),
                child: ListView(
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
                        print(controllerfav.fav);
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    controller.issearch == false
                        ? ListView(
                            shrinkWrap: true,
                            children: [
                                Cashbackhome(title: "${controller.title}"),
                              const Producation(title: "catagries"),
                             const Catagireshome(),
                                const Producation(title: "Top Selling"),
                           const SizedBox(
                                height: 6,
                              ),
                               const Producthome()
                            ],
                          )
                        : GridView.builder(
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
                ),
              ),
            ));
  }
}

class Searchprodict extends StatelessWidget {
  final ItemModel itemModel;
  const Searchprodict({super.key, required this.itemModel});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(itemModel.itemNameEn!);
  }
}
