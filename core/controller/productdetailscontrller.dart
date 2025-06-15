import 'package:ecommerce/core/funcation/handlingdata.dart';
import 'package:ecommerce/core/funcation/statesrequest.dart';
import 'package:ecommerce/core/servces/servecis.dart';
import 'package:ecommerce/data/cart/cartcountdata.dart';

import 'package:ecommerce/data/cart/cartinsertdata.dart';
import 'package:ecommerce/data/cart/coupondata.dart';
import 'package:ecommerce/data/cart/deletcartdata.dart';
import 'package:ecommerce/data/cart/getcartdata.dart';
import 'package:ecommerce/data/cart/removecartdata.dart';
import 'package:ecommerce/data/model/cartmodel.dart';
import 'package:ecommerce/data/model/couponmodel.dart';
import 'package:ecommerce/data/model/itemmodle.dart';
import 'package:ecommerce/data/model/pagemodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class Productdetailscontrller extends GetxController {
  gotocart();
  insertdata(int itemid);
}

class Productdetailscontrllerimp extends Productdetailscontrller {
  Statesrequest statesrequest = Statesrequest.none;
  Cartinsertdata cartinsertdata = Cartinsertdata(Get.find());
  Myservecis myservecis = Get.find();
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  Coupondata coupondata = Coupondata(Get.find());
  late TextEditingController name;
  List<CouponModel> couponlist = [];

  Removecartdata removecartdata = Removecartdata(Get.find());
  int cartcout = 0;
  int totalprice = 0;
  int totalcount = 0;
  int count = 0;
  int coupondiscount = 0;
  int? couponid;
  String? couponname;

  late ItemModel itemModel;
  List<CartModel> data = [];
  Getcartdata getcartdata = Getcartdata(Get.find());
  Delercartdata delercartdata = Delercartdata(Get.find());
  Cartcoundata cartcoundata = Cartcoundata(Get.find());
  totalpriceafterdiscount() {
    return totalprice - totalprice * coupondiscount / 100;
  }

  inital() async {
    statesrequest = Statesrequest.loading;
    cartcout = await cartcount();
    statesrequest = Statesrequest.success;
    print(cartcout);
    update();
  }

  @override
  void onInit() {
    totalpriceafterdiscount();
    itemModel = Get.arguments["itemmodel"];
    name = TextEditingController();
    selectcart();
    inital();

    super.onInit();
  }

  List itemcolor = [
    {
      "name": "mobile",
      "color": "red",
    },
    {
      "name": "mobile",
      "color": "black",
    },
    {
      "name": "mobile",
      "color": "blue",
    }
  ];

  @override
  gotocart() {
    Get.toNamed(Appdata.cart);
  }

  @override
  insertdata(int itemid) async {
    cartcout++;
    statesrequest = Statesrequest.loading;
    update();
    var response = await cartinsertdata.insert(
        myservecis.sharedPreferences.getInt("id")!, itemid);
    statesrequest = handlindata(response);
    if (statesrequest == Statesrequest.success) {
      if (response["status"] == "success") {
      } else {
        print("no cart");
      }
    } else {
      statesrequest = Statesrequest.failur;
    }
    update();
  }

  removecart(int itemid) async {
    if (cartcout > 0) {
      cartcout--;
      statesrequest = Statesrequest.loading;
      update();
      var response = await removecartdata.removecart(
          myservecis.sharedPreferences.getInt("id")!, itemid);
      statesrequest = handlindata(response);
      if (statesrequest == Statesrequest.success) {
        if (response["status"] == "success") {}
      } else {
        statesrequest = Statesrequest.failur;
      }
    } else {
      cartcout = 0;
    }
    update();
  }

  selectcart() async {
    data.clear();
    statesrequest = Statesrequest.loading;
    update();
    var response =
        await getcartdata.select(myservecis.sharedPreferences.getInt("id")!);
    statesrequest = handlindata(response);
    if (statesrequest == Statesrequest.success) {
      if (response["status"] == "success") {
        List listresponse = response["data"];

        data.addAll(listresponse.map(
          (e) => CartModel.fromJson(e),
        ));
        Map total = response["total"];
        totalprice = total["sumprice"] != null
            ? int.parse(total["sumprice"].toString())
            : 0;
        totalcount = total["sumcount"] != null
            ? int.parse(total["sumcount"].toString())
            : 0;
        print(totalcount);
        print(totalprice);

        print("////////datacart${data}");
      }
    } else {
      statesrequest = Statesrequest.failur;
    }
    update();
  }

  deletcart() {
    delercartdata.delet(
        myservecis.sharedPreferences.getInt("id")!, itemModel.itemId!);
    data.removeWhere((e) => e.itemId == itemModel.itemId);
    selectcart();

    update();
  }

  cartcount() async {
    statesrequest = Statesrequest.loading;
    var response = await cartcoundata.count(
        myservecis.sharedPreferences.getInt("id")!, itemModel.itemId!);
    statesrequest = handlindata(response);

    if (statesrequest == Statesrequest.success) {
      if (response["status"] == "success") {
        count = int.parse(response["data"].toString());

        print("09009090909$count");
        return count;
      }
    } else {
      statesrequest = Statesrequest.failur;
    }
    update();
  }

  selectcoupon() async {
    if (formstate.currentState!.validate()) {
      statesrequest = Statesrequest.loading;
      update();
      var response = await coupondata.getcoupon(name.text);
      statesrequest = handlindata(response);
      if (statesrequest == Statesrequest.success) {
        if (response["status"] == "success") {
          List responselist = response["data"];
          couponlist.addAll(responselist.map((e) => CouponModel.fromJson(e)));
          coupondiscount =
              int.parse(responselist[0]["coupon_discount"].toString());
          print(coupondiscount);
          couponid = responselist[0]["coupon_id"];
          couponname = responselist[0]["coupon_name"];
          print(couponid);
          print(couponname);
          print(coupondiscount);
        }
      } else {
        statesrequest = Statesrequest.failur;
        coupondiscount = 0;
      }
    } else {
      print("not valid");
    }

    update();
  }

  gotCheckout() {
    if (data.isEmpty) return null;
    Get.toNamed(Appdata.checkout, arguments: {
      
      "totalprice": totalprice,
      "couponid": couponid,
      "itemmodel": itemModel,
      "coupondiscount": coupondiscount,
      "couponname": couponname
    });
  }
}
