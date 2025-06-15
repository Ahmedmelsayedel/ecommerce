import 'package:ecommerce/core/servces/servecis.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Changelanguage extends GetxController {
  Locale? language;
  Myservecis myservecis = Get.find();
  changlang(String langcode) {
    Locale locale = Locale(langcode);
    myservecis.sharedPreferences.setString("lang", langcode);
    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    String? sherdpref = myservecis.sharedPreferences.getString("lang");
    if (sherdpref == "ar") {
      language = const Locale("ar");
    }
    if (sherdpref == "en") {
      language = const Locale("en");
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
    }
    super.onInit();
  }
}
