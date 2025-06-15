import 'package:ecommerce/core/funcation/handlingdata.dart';
import 'package:ecommerce/core/funcation/statesrequest.dart';
import 'package:ecommerce/data/forgetpassword/checkemaildata.dart';
import 'package:ecommerce/data/model/pagemodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class Forgetpasswordcontroller extends GetxController {
  chekemial();
}

class Forgetpasswordcontrollerimp extends Forgetpasswordcontroller {
  late TextEditingController email;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  Checkemaildata checkemaildata = Checkemaildata(Get.find());
  Statesrequest statesrequest = Statesrequest.none;

  void onInit() {
    email = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();

    super.dispose();
  }

  @override
  chekemial() async {
    if (formstate.currentState!.validate()) {
      statesrequest = Statesrequest.loading;
      update();
      var response = await checkemaildata.postdatachekemail(email.text);
      statesrequest = handlindata(response);
      if (statesrequest == Statesrequest.success) {
        if (response["status"] == "success") {
          Get.offAllNamed(Appdata.verifycode, arguments: {"email": email.text});
        } else {
          statesrequest = Statesrequest.failur;
          Get.defaultDialog(
              title: "warrning",
              middleText: "please check your email and try again");
        }
      }
      update();
    }
  }
}
