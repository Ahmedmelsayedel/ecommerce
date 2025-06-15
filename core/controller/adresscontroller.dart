import 'package:ecommerce/core/funcation/handlingdata.dart';
import 'package:ecommerce/core/funcation/statesrequest.dart';
import 'package:ecommerce/core/servces/servecis.dart';
import 'package:ecommerce/data/adressdata.dart';
import 'package:ecommerce/data/model/adressmodel.dart';
import 'package:ecommerce/data/model/pagemodel.dart';
import 'package:ecommerce/veiw/adress/updataadress.dart';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class Adresscontroller extends GetxController {
  List<AdressModel> data = [];
  late AdressModel adressModel;


  DeleteAdressdata deleteAdressdata = DeleteAdressdata(Get.find());
  Myservecis myservecis = Get.find();
  AddAdressdata addAdressdata = AddAdressdata(Get.find());
  ViewAdressdata viewAdressdata = ViewAdressdata(Get.find());
  UpdateAdressdata updateAdressdata = UpdateAdressdata(Get.find());
  Statesrequest statesrequest = Statesrequest.none;
  GlobalKey<FormState> formstate = GlobalKey();
  late TextEditingController city;
  late TextEditingController street;
  @override
  void onInit() {
    street = TextEditingController();
    city = TextEditingController();

    viewadress();

    super.onInit();
  }

  addadress() async {
    if (formstate.currentState!.validate()) {
      statesrequest = Statesrequest.loading;
      var response = await addAdressdata.add(
          myservecis.sharedPreferences.getInt("id")!, city.text, street.text);
      statesrequest = handlindata(response);
      if (statesrequest == Statesrequest.success) {
        if (response["status"] == "success") {
          Get.offAllNamed(Appdata.homepage);
        } else {
          
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

  deleteadress(int adressid) async {
    await deleteAdressdata.delete(adressid);
    data.removeWhere((e) => e.adressid == adressid);
    update();
  }

  viewadress() async {
    data.clear();
    statesrequest = Statesrequest.loading;
    update();
    var response =
        await viewAdressdata.view(myservecis.sharedPreferences.getInt("id")!);
    statesrequest = handlindata(response);
    if (statesrequest == Statesrequest.success) {
      if (response["status"] == "success") {
        List responsebody = response["data"];
        data.addAll(responsebody.map((e) => AdressModel.fromJson(e)));
      }
    } else {
      statesrequest == Statesrequest.failur;
      print("adressfailur");
    }
    update();
  }

  gotoupdatadress() {
    Get.toNamed(Appdata.updataadress);
  }
}
