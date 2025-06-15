import 'package:ecommerce/core/servces/servecis.dart';
import 'package:ecommerce/data/model/pagemodel.dart';
import 'package:ecommerce/data/static/static.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class Onbordingconrtoller extends GetxController {
  next();

  pagenext(int index);
}

class Onbordingcontrollerimp extends Onbordingconrtoller {
  Myservecis myservecis = Get.find();
  late PageController pageController;
  int currentindx = 0;
  @override
  next() {
    currentindx++;
    if (currentindx > onbordingmodel.length - 1) {
      myservecis.sharedPreferences.setString("step", "1");
      Get.offAllNamed(Appdata.login);
    } else {
      pageController.animateToPage(currentindx,
          duration: const Duration(microseconds: 1000),
          curve: Curves.easeInOut);
    }
  }

  @override
  pagenext(int index) {
    currentindx = index;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    pageController = PageController();
  }
}
