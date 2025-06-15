import 'package:ecommerce/controller/itemcontroller.dart';
import 'package:ecommerce/core/funcation/changelanguagedatabase.dart';
import 'package:ecommerce/data/model/catagriesmodel.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

class Catagiresitems extends GetView<Itemcontrollerimp> {
  const Catagiresitems({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Itemcontrollerimp());
    // TODO: implement build
    return SizedBox(
      height: 125,
      width: 250,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: controller.catagries.length,
        itemBuilder: (context, index) {
          int i = index;
          return Catagireswedgit(i,
              catagriesModel:
                  CatagriesModel.fromJson(controller.catagries[index]));
        },
      ),
    );
  }
}

class Catagireswedgit extends GetView<Itemcontrollerimp> {
  final int? i;
  final CatagriesModel catagriesModel;
  const Catagireswedgit(this.i, {super.key, required this.catagriesModel});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return (Container(
        padding: EdgeInsets.all(25),
        child: Column(
          children: [
            GetBuilder<Itemcontrollerimp>(
                builder: (controller) => InkWell(
                      onTap: () {
                        controller.changeitemcount(i!);

                        controller
                            .changid(catagriesModel.catagriesId.toString());
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            border: controller.itemcount == i
                                ? Border(
                                    bottom: BorderSide(
                                        width: 5,
                                        color: const Color.fromARGB(
                                            255, 3, 53, 94)))
                                : null),
                        child: Text(
                          "${Changelanguagedatabase(catagriesModel.catagriesNameAr!, catagriesModel.catagriesNameEn!)}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ),
                    ))
          ],
        )));
  }
}
