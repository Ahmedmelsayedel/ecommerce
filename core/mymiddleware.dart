import 'package:ecommerce/core/servces/servecis.dart';
import 'package:ecommerce/data/model/pagemodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Mymiddleware extends GetMiddleware {
  Myservecis myservecis = Get.find();
  @override
  // TODO: implement priority
  int? get priority => 1;
  @override
  RouteSettings? redirect(String? route) {
    if (myservecis.sharedPreferences.getString("step") == "2") {
      return RouteSettings(name: Appdata.homepage);
    }
    
    if (myservecis.sharedPreferences.getString("step") == "1") {
      return RouteSettings(name: Appdata.login);
    }
    
  }
}
