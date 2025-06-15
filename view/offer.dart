import 'package:ecommerce/controller/favouritecontroller.dart';
import 'package:ecommerce/controller/offercontroller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/data/model/pagemodel.dart';
import 'package:ecommerce/veiw/wedgit/home/appbarhome.dart';
import 'package:ecommerce/veiw/wedgit/home/itemwidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Offer extends StatelessWidget {
  const Offer({super.key});

  @override
  Widget build(BuildContext context) {
    Favouritecontroller controllerfav = Get.put(Favouritecontroller());
    Get.put(Offercontroller());
    // TODO: implement build
    return GetBuilder<Offercontroller>(
        builder: (controller) => Handlingdataview(
            statesrequest: controller.statesrequest,
            widget: Container(
              padding: EdgeInsets.all(10),
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
                      hinttext: "Search",
                      onpressedfavourite: () {
                        controllerfav.getfav();
                        Get.toNamed(Appdata.favouritepage);
                      }),
                  controller.issearch == false
                      ? ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: controller.data.length,
                          itemBuilder: (context, index) {
                            return Itemwidget(
                                itemModel: controller.data[index]);
                          })
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
                        ),
                ],
              ),
            )));
  }
}
