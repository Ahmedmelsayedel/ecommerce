import 'package:ecommerce/core/middleware/mymiddleware.dart';
import 'package:ecommerce/data/model/pagemodel.dart';
import 'package:ecommerce/veiw/adress/addAdress.dart';
import 'package:ecommerce/veiw/adress/deletadress.dart';
import 'package:ecommerce/veiw/adress/updataadress.dart';
import 'package:ecommerce/veiw/adress/viewadress.dart';
import 'package:ecommerce/veiw/orderarchiveh.dart';
import 'package:ecommerce/veiw/orderdetails.dart';
import 'package:ecommerce/veiw/ordermoredetails.dart';
import 'package:ecommerce/veiw/producationdetails.dart';
import 'package:ecommerce/veiw/screen/auth/checkout.dart';

import 'package:ecommerce/veiw/screen/auth/codeemail.dart';
import 'package:ecommerce/veiw/screen/auth/forgetpassword.dart';
import 'package:ecommerce/veiw/screen/auth/login.dart';
import 'package:ecommerce/veiw/screen/auth/resetpassword.dart';
import 'package:ecommerce/veiw/screen/auth/sinup.dart';
import 'package:ecommerce/veiw/screen/auth/verifycode.dart';
import 'package:ecommerce/veiw/screen/cart.dart';
import 'package:ecommerce/veiw/screen/favouritepage.dart';
import 'package:ecommerce/veiw/screen/homepage.dart';
import 'package:ecommerce/veiw/screen/homescreen.dart';
import 'package:ecommerce/veiw/screen/itemspage.dart';
import 'package:ecommerce/veiw/screen/onbonding.dart';
import 'package:ecommerce/veiw/screen/pagelanguage.dart';
import 'package:ecommerce/veiw/screen/setting.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
      name: "/",
      page: () => const Pagelanguage(),
      middlewares: [Mymiddleware()]),
  GetPage(name: Appdata.login, page: () => const Login()),
  GetPage(name: Appdata.onbording, page: () => const Onbonding()),
  GetPage(name: Appdata.signup, page: () => const Signup()),
  GetPage(name: Appdata.forgetpassword, page: () => const Forgetpassword()),
  GetPage(name: Appdata.verifycode, page: () => const Verifycode()),
  GetPage(name: Appdata.resetpassword, page: () => const Resetpassword()),
  GetPage(name: Appdata.codeemail, page: () => const Codeemail()),
  GetPage(name: Appdata.homepage, page: () => const Homescreen()),
  GetPage(name: Appdata.itemspage, page: () => const Itemspage()),
  GetPage(name: Appdata.productdetails, page: () => const Producationdetails()),
  GetPage(name: Appdata.favouritepage, page: () => const Favouritepage()),
  GetPage(name: Appdata.setting, page: () => const Setting()),

  GetPage(name: Appdata.cart, page: () => const Cart()),
  //===================adress=======================//
  GetPage(name: Appdata.addadress, page: () => const AddAdress()),
  GetPage(name: Appdata.viewadress, page: () => const ViewAdress()),
  GetPage(name: Appdata.updataadress, page: () => const Updateadress()),
  GetPage(name: Appdata.deleteadress, page: () => const DeleteAdress()),
  GetPage(name: Appdata.checkout, page: () => const Checkout()),
  GetPage(name: Appdata.orderdetails, page: () => const Orderdetails()),
  GetPage(name: Appdata.orderarchive, page: () => const Orderarchiveh()),
  
];

