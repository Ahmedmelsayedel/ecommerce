import 'package:ecommerce/controller/productdetailscontrller.dart';
import 'package:ecommerce/core/funcation/handlingdata.dart';
import 'package:ecommerce/core/funcation/statesrequest.dart';
import 'package:ecommerce/core/servces/servecis.dart';
import 'package:ecommerce/data/adressdata.dart';
import 'package:ecommerce/data/cart/deleteallcartdata.dart';
import 'package:ecommerce/data/model/adressmodel.dart';
import 'package:ecommerce/data/model/itemmodle.dart';
import 'package:ecommerce/data/model/pagemodel.dart';
import 'package:ecommerce/data/order/orderdata.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class Checkoutcontroller extends GetxController {
  Statesrequest statesrequest = Statesrequest.none;
  ViewAdressdata viewAdressdata = ViewAdressdata(Get.find());
  Deleteallcartdata deleteallcartdata = Deleteallcartdata(Get.find());

  Myservecis myservecis = Get.find();
  List<AdressModel> datacheck = [];
  String? payment;
  String? delivery;
  int adressid = 0;
  String? stat;
  int? totalprice;
  int? couponid;
  int deleveryprice = 10;
  int coupondiscount = 0;

  String? couponname;
  late ItemModel itemModel;
  Orderdata orderdata = Orderdata(Get.find());
  chosepayment(String val) {
    payment = val;
    update();
  }

  chosedelivery(String val) {
    delivery = val;
    update();
  }

  chosepadress(int val) {
    adressid = val;
    update();
  }

  viewadress() async {
    datacheck.clear();
    statesrequest = Statesrequest.loading;
    update();
    var response =
        await viewAdressdata.view(myservecis.sharedPreferences.getInt("id")!);
    statesrequest = handlindata(response);
    if (statesrequest == Statesrequest.success) {
      if (response["status"] == "success") {
        List responsebody = response["data"];
        datacheck.addAll(responsebody.map((e) => AdressModel.fromJson(e)));
      } else {
        stat = "faillur";
      }
    } else {
      statesrequest == Statesrequest.failur;
      print("adressfailur");
    }
    update();
  }

  @override
  void onInit() {
    viewadress();

    totalprice = Get.arguments["totalprice"];
    couponid = Get.arguments["couponid"];
    itemModel = Get.arguments["itemmodel"];
    coupondiscount = Get.arguments["coupondiscount"];
    couponname = Get.arguments["couponname"];

    super.onInit();
  }

  addorder() async {
    if (payment == null) return Get.snackbar("error", "please chose payment");
    if (delivery == null)
      return Get.snackbar("error", "please chose way to delevery");

    statesrequest = Statesrequest.loading;
    var response = await orderdata.order({
      "userid": myservecis.sharedPreferences.getInt("id").toString(),
      "price": itemModel.priceDiscount.toString(),
      "payment": payment,
      "type": delivery.toString(),
      "deleveryprice": deleveryprice.toString(),
      "coupon": couponid.toString(),
      "adress": adressid.toString(),
      "coupondiscount": coupondiscount.toString(),
      "name": couponname.toString()
    });
    statesrequest = handlindata(response);
    if (statesrequest == Statesrequest.success) {
      if (response["status"] == "success") {
        print("done order");
        Get.offAllNamed(Appdata.homepage);
        deletcart();
      }
    } else {
      statesrequest = Statesrequest.failur;
    }
    update();
  }

  checkouttoadress() {
    if (delivery == "receive") {
      addorder();
    } else if (stat == "faillur") {
      Get.defaultDialog(
          title: "Error",
          middleText: "please add your adress",
          confirm: ElevatedButton(
              onPressed: () {
                Get.offNamed(Appdata.addadress);
              },
              child: Text("go to add adress")));
    } else if (adressid == 0) {
      Get.snackbar("error", "please choose adress");
    } else {
      addorder();
    }
  }

  deletcart() async {
    await deleteallcartdata
        .deletelall(myservecis.sharedPreferences.getInt("id")!);
  }
}
