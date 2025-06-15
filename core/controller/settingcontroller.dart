

import 'package:ecommerce/core/servces/servecis.dart';

import 'package:ecommerce/data/model/pagemodel.dart';
import 'package:get/get.dart';

class Settingcontroller extends GetxController {

  Myservecis myservecis = Get.find();

  
  logout() {
    myservecis.sharedPreferences.clear();
    Get.offAllNamed(Appdata.login);
  }

 

  @override
  void onInit() {
    
    super.onInit();
  }

  gotoadress() {
    Get.toNamed(Appdata.viewadress
      
    );
  }

}
