import 'package:ecommerce/core/funcation/handlingdata.dart';
import 'package:ecommerce/core/funcation/statesrequest.dart';
import 'package:ecommerce/core/servces/servecis.dart';
import 'package:ecommerce/data/adressdata.dart';
import 'package:ecommerce/data/model/pagemodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class Updataadressconrtoller extends GetxController {
  TextEditingController? city;
  TextEditingController? street;
  GlobalKey<FormState> formstate2 = GlobalKey();
  Statesrequest statesrequest = Statesrequest.none;
  UpdateAdressdata updateAdressdata = UpdateAdressdata(Get.find());
  Myservecis myservecis = Get.find();

  @override
  void onInit() {
    city = TextEditingController();
    street = TextEditingController();
    super.onInit();
  }

  updataadress() async {
    if (formstate2.currentState!.validate()) {
      statesrequest = Statesrequest.loading;
      var response = await updateAdressdata.update(
          myservecis.sharedPreferences.getInt("id")!, city!.text, street!.text);
      statesrequest = handlindata(response);
      if (statesrequest == Statesrequest.success) {
        if (response["status"] == "success") {
          Get.offAllNamed(Appdata.homepage);
        }
      } else {
        statesrequest = Statesrequest.failur;
        print("failer");
      }
    } else {
      print("notvalid");
    }
    update();
  }
}
