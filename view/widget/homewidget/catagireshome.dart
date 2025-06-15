import 'package:ecommerce/controller/homepagecontroller.dart';
import 'package:ecommerce/core/funcation/changelanguagedatabase.dart';
import 'package:ecommerce/data/model/catagriesmodel.dart';
import 'package:ecommerce/linkapi.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

class Catagireshome extends GetView<Homepagecontrollerimp> {
  const Catagireshome({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Homepagecontrollerimp());
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
            }));
  }
}

class Catagireswedgit extends GetView<Homepagecontrollerimp> {
  final int? i;
  final CatagriesModel catagriesModel;
  const Catagireswedgit(this.i, {super.key, required this.catagriesModel});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        padding: EdgeInsets.all(25),
        child: InkWell(
          onTap: () {
            print("+++++${catagriesModel.catagriesId}");
            controller.gotoitem(
                controller.catagries, i!, catagriesModel.catagriesId.toString());
          },
          child: Column(
            children: [
              Container(
                width: 80,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromARGB(255, 167, 205, 236)),
                child: SvgPicture.network(
                  "${Apidata.imagecatagries}/${catagriesModel.catagriesImage}.svg",
                  height: 50,
                  width: 40,
                ),
              ),
              Text(
                "${Changelanguagedatabase(catagriesModel.catagriesNameAr!, catagriesModel.catagriesNameEn!)}",
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
        ));
  }
}
