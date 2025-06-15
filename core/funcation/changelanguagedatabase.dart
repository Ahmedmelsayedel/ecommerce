import 'package:ecommerce/core/servces/servecis.dart';
import 'package:get/get.dart';

Changelanguagedatabase(String codear, String codeen) {
  Myservecis myservecis = Get.find();
  if (myservecis.sharedPreferences.getString("lang") == "ar") {
    return codear;
  } else {
    return codeen;
    
  }
}
