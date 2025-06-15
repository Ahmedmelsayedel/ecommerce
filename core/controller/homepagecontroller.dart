

import 'package:ecommerce/core/funcation/handlingdata.dart';
import 'package:ecommerce/core/funcation/statesrequest.dart';
import 'package:ecommerce/core/servces/servecis.dart';
import 'package:ecommerce/data/homedata.dart';
import 'package:ecommerce/data/model/itemmodle.dart';
import 'package:ecommerce/data/model/pagemodel.dart';
import 'package:ecommerce/data/search/searchdata.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class Homepagecontroller extends Searchmixcontroller {
  intilal() {}
  gotoitem(List catagries, int itemcount, String catagriesid);
}

class Homepagecontrollerimp extends Homepagecontroller {
  String? username;
  int? id;
  List items = [];
  List catagries = [];
  String? title;

  HomeData homeData = HomeData(Get.find());

  Myservecis myservecis = Get.find();
  @override
  intilal() async {
    statesrequest = Statesrequest.loading;
    var response = await homeData.getdata();
    statesrequest = handlindata(response);
    if (statesrequest == Statesrequest.success) {
      if (response["status"] == "success") {
        catagries.addAll(response["catagries"]);
        items.addAll(response["items"]);
        List listtitle = response["title"];
        title = listtitle[0]["title_body"];
        print(title);
      }
    }
    update();
  }

  @override
  gotoitem(catagries, itemcount, catagriesid) {
    Get.toNamed(Appdata.itemspage, arguments: {
      "catagries": catagries,
      "itemcount": itemcount,
      "catagriesid": catagriesid
    });
  }

  @override
  void onInit() {
    intilal();
    super.onInit();
  }
}

class Searchmixcontroller extends GetxController {
  TextEditingController? search;
  Searchdata searchdata = Searchdata(Get.find());
  List<ItemModel> listdata = [];
  Statesrequest statesrequest = Statesrequest.none;
  bool issearch = false;
  searchactive() {
    issearch = true;
    searchitem();
    update();
  }

  searchoff(val) {
    if (val == "") {
      issearch = false;
    }
    update();
  }

  searchitem() async {
    listdata.clear();
    statesrequest = Statesrequest.loading;
    var response = await searchdata.select(search!.text);
    statesrequest = handlindata(response);
    if (statesrequest == Statesrequest.success) {
      if (response["status"] == "success") {
        List listresponse = response["data"];
        listdata.addAll(listresponse.map((e) => ItemModel.fromJson(e)));
      }
    } else {
      statesrequest = Statesrequest.failur;
    }
    update();
  }

  @override
  void onInit() {
    search = TextEditingController();
    super.onInit();
  }

  gotoprodicution(ItemModel itemModel) {
    Get.toNamed(Appdata.productdetails, arguments: {"itemmodel": itemModel});
  }
}
