import 'package:ecommerce/core/funcation/handlingdata.dart';
import 'package:ecommerce/core/funcation/statesrequest.dart';
import 'package:ecommerce/data/forgetpassword/verifycodedata.dart';
import 'package:ecommerce/data/model/pagemodel.dart';

import 'package:get/get.dart';

abstract class Verifycode extends GetxController {
  checkcode(String verificationCode);
  goToresetpassword();
}

class Verifycodeimp extends Verifycode {
  String? email;
  Verifycodedata verifycodedata = Verifycodedata(Get.find());

  Statesrequest statesrequest = Statesrequest.none;

  void onInit() {
    email = Get.arguments["email"];

    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  checkcode(verificationCode) async {
    statesrequest = Statesrequest.loading;
    update();
    var response =
        await verifycodedata.postverifycode(email!, verificationCode);
    statesrequest = handlindata(response);
    if (statesrequest == Statesrequest.success) {
      if (response["status"] == "success") {
        Get.offAllNamed(Appdata.resetpassword, arguments: {"email": email});
      } else {
        statesrequest = Statesrequest.failur;
        Get.defaultDialog(
            title: "warrning",
            middleText: "please check your code and try again");
      }
    }
    update();
  }

  @override
  goToresetpassword() {
    Get.offAllNamed(Appdata.resetpassword);
  }
}
