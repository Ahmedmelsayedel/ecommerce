import 'package:ecommerce/core/funcation/handlingdata.dart';
import 'package:ecommerce/core/funcation/statesrequest.dart';
import 'package:ecommerce/data/auth/sinupdata.dart';
import 'package:ecommerce/data/model/pagemodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class Signupcontroller extends GetxController {
  sign();
  goTocheckemail();
  gotologin();
}

class Signupcontrollerimp extends Signupcontroller {
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController username;
  late TextEditingController phone;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  bool hidepass = true;
  Sinupdata sinupdata = Sinupdata(Get.find());

  Statesrequest statesrequest = Statesrequest.none;

  showpassword() {
    hidepass = hidepass == true ? false : true;
    update();
  }

  @override
  goTocheckemail() {}

  @override
  sign() async {
    if (formstate.currentState!.validate()) {
      statesrequest = Statesrequest.loading;
      update();
      var response = await sinupdata.postdata2(
          username.text, email.text, phone.text, password.text);
      statesrequest = handlindata(response);
      print("==========handlin    $response");
      if (Statesrequest.success == statesrequest) {
        if (response["status"] == "success") {
          Get.offAllNamed(Appdata.codeemail, arguments: {"email": email.text});
        } else {
          statesrequest = Statesrequest.failur;
          Get.defaultDialog(
              title: "warrning", middleText: "this email is found");
        }
      }
      update();
    } else {
      return "not valid";
    }
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    username = TextEditingController();
    phone = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    username.dispose();
    phone.dispose();
    super.dispose();
  }

  @override
  gotologin() {
    Get.offNamed(Appdata.login);
  }
}
