import 'package:ecommerce/core/funcation/handlingdata.dart';
import 'package:ecommerce/core/funcation/statesrequest.dart';
import 'package:ecommerce/core/servces/servecis.dart';

import 'package:ecommerce/data/cart/cartcountdecreasedata.dart';
import 'package:ecommerce/data/cart/cartcountincreasedata.dart';
import 'package:ecommerce/data/cart/cartinsertdata.dart';
import 'package:ecommerce/data/cart/coupondata.dart';
import 'package:ecommerce/data/cart/deletcartdata.dart';

import 'package:ecommerce/data/model/cartmodel.dart';
import 'package:ecommerce/data/model/couponmodel.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class Cartcontroller extends GetxController {
  List<CartModel> data = [];
  List<CouponModel> couponlist = [];
  Coupondata coupondata = Coupondata(Get.find());
  late TextEditingController name;
  Cartinsertdata cartinsertdata = Cartinsertdata(Get.find());
  Statesrequest statesrequest = Statesrequest.none;

  Delercartdata delercartdata = Delercartdata(Get.find());
  Cartcountincreasedata cartcountincreasedata =
      Cartcountincreasedata(Get.find());
  Cartcountdecreasedata cartcountdecreasedata =
      Cartcountdecreasedata(Get.find());
  int coupondiscount = 0;

  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  Myservecis myservecis = Get.find();

  

  @override
  void onInit() {
    name = TextEditingController();
    super.onInit();
  }
}
