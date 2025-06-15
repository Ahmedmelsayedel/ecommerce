import 'package:ecommerce/core/funcation/handlingdata.dart';
import 'package:ecommerce/core/funcation/statesrequest.dart';
import 'package:ecommerce/core/servces/servecis.dart';
import 'package:ecommerce/data/home/favouritepagedata.dart';
import 'package:get/get.dart';

abstract class Favouritepagecontroller extends GetxController {
  getfav();
}

class Favouritepagecontrollerimp extends Favouritepagecontroller {
  Favouritepagedata favouritepagedata = Favouritepagedata(Get.find());
  Statesrequest statesrequest = Statesrequest.none;
  Myservecis myservecis = Get.find();
  List fav = [];
  @override
  getfav() async {
    fav.clear();
    statesrequest = Statesrequest.loading;
    var response = await favouritepagedata
        .getdatafav(myservecis.sharedPreferences.getInt("id")!);
    statesrequest = handlindata(response);
    if (statesrequest == Statesrequest.success) {
      if (response["status"] == "success") {
        fav.addAll(response["data"]);
        print("favvvvvv");
      }
    } else {
      statesrequest = Statesrequest.failur;
    }
  }
}
