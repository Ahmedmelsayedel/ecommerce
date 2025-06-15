import 'package:ecommerce/data/model/cartmodel.dart';
import 'package:ecommerce/data/model/pagemodel.dart';
import 'package:ecommerce/veiw/offer.dart';

import 'package:ecommerce/veiw/screen/homepage.dart';
import 'package:ecommerce/veiw/screen/setting.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class Homescreencontroller extends GetxController {
  movepage(int i) {}
  gotobasket();
}

class Homescreencontrollerimp extends Homescreencontroller {
  int curentpage = 0;
  List<Widget> listpage = [
    const Homepage(),
    const Setting(),
    const Offer(),
    const Center(
      child: Text("pagethere"),
    ),
  ];
  List<String> titleappbar = ["home", "setting", "offer", "basket"];
  List<IconData> iconappbar = [
    Icons.home,
    Icons.settings,
    Icons.discount_sharp,
    Icons.shopping_basket,
  ];

  List<CartModel> data = [];
  @override
  movepage(int i) {
    curentpage = i;
    update();
  }

  gotobasket() {
    Get.toNamed(Appdata.cart);
  }
}
