import 'package:ecommerce/core/funcation/handlingdata.dart';
import 'package:ecommerce/core/funcation/statesrequest.dart';
import 'package:ecommerce/data/forgetpassword/resetpassworddata.dart';
import 'package:ecommerce/data/model/pagemodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class Resetpasswordcontroller extends GetxController {
  resetpassword();
  gotologin();
}

class Resetpasswordcontrollerimp extends Resetpasswordcontroller {
  late TextEditingController password;
  late TextEditingController newpassword;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  Resetpassworddata resetpassworddata = Resetpassworddata(Get.find());
  String? email;

   Statesrequest statesrequest = Statesrequest.none;
  bool hidepass = true;

  showpassword() {
    hidepass = hidepass == true ? false : true;
    update();
  }

  bool hidepass2 = true;
  showpassword2() {
    hidepass2 = hidepass2 == true ? false : true;
    update();
  }

  @override
  void onInit() {
    email = Get.arguments["email"];
    password = TextEditingController();
    newpassword = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    newpassword.dispose();
    super.dispose();
  }

  @override
  gotologin() {}

  @override
  resetpassword() async {
    if (password.text != newpassword.text) {
      return Get.defaultDialog(
          title: "fail", middleText: "you password not equal");
    }
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      statesrequest = Statesrequest.loading;
      update();
      var response =
          await resetpassworddata.postRestpassword(email!, password.text);
      statesrequest = handlindata(response);
      if (statesrequest == Statesrequest.success) {
        if (response["status"] == "success") {
          Get.offNamed(Appdata.login);
          Get.defaultDialog(
              title: "success", middleText: "Enter your email and password");
        }
      } else {
        statesrequest = Statesrequest.failur;
      }
      update();
    } else {
      print("notvalid");
    }
  }
}
