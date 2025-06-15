import 'package:ecommerce/controller/homepagecontroller.dart';
import 'package:ecommerce/core/funcation/handlingdata.dart';
import 'package:ecommerce/core/funcation/statesrequest.dart';
import 'package:ecommerce/data/model/itemmodle.dart';
import 'package:ecommerce/data/offerdata.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Offercontroller extends Searchmixcontroller {
  Statesrequest statesrequest = Statesrequest.none;
  Offerdata offerdata = Offerdata(Get.find());
  List<ItemModel> data = [];
  getofferdata() async {
    statesrequest = Statesrequest.loading;
    var response = await offerdata.getdata();
    statesrequest = handlindata(response);
    if (statesrequest == Statesrequest.success) {
      if (response["status"] == "success") {
        List responselist = response["data"];
        data.addAll(responselist.map((e) => ItemModel.fromJson(e)));
        print(responselist);
      }
    } else {
      statesrequest = Statesrequest.failur;
    }
    update();
  }

  @override
  void onInit() {
    search = TextEditingController();
    // TODO: implement onInit
    super.onInit();
    getofferdata();
  }
}
