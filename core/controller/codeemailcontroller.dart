import 'package:ecommerce/core/funcation/handlingdata.dart';
import 'package:ecommerce/core/funcation/statesrequest.dart';
import 'package:ecommerce/data/auth/verifydata.dart';
import 'package:ecommerce/data/model/pagemodel.dart';
import 'package:get/get.dart';

abstract class Codeemailcontroller extends GetxController {
  checkcode();
  goTologin(String verificationCode);
}

class Codeemailcontrollerimp extends Codeemailcontroller {
  Statesrequest statesrequest = Statesrequest.none;
  Verifydata verifydata = Verifydata(Get.find());
  String? email;

  @override
  checkcode() {}

  @override
  goTologin(verificationCode) async {
    statesrequest = Statesrequest.loading;
    var response = await verifydata.postverify(email!, verificationCode);
    statesrequest = handlindata(response);
    if (statesrequest == Statesrequest.success) {
      if (response["status"] == "success") {
        Get.offAllNamed(Appdata.login);
        Get.defaultDialog(
            title: "success", middleText: "enter your email and password");
      } else {
        statesrequest = Statesrequest.failur;
        Get.defaultDialog(
            title: "failur", middleText: "enter your correct code");
      }
    }
    update();
  }

  @override
  void onInit() {
    email = Get.arguments["email"];
    super.onInit();
  }
}
