import 'package:ecommerce/core/funcation/handlingdata.dart';
import 'package:ecommerce/core/funcation/statesrequest.dart';
import 'package:ecommerce/core/servces/servecis.dart';
import 'package:ecommerce/data/home/deletfavcard.dart';
import 'package:ecommerce/data/home/favouritedata.dart';
import 'package:ecommerce/data/home/favouritepagedata.dart';
import 'package:ecommerce/data/model/favouritemodel.dart';

import 'package:get/get.dart';

class Favouritecontroller extends GetxController {
  Map isfavourite = {};

  setfavourite(id, value) {
    isfavourite[id] = value;
    update();
  }

  Myservecis myservecis = Get.find();

  Favouritedata favouritedata = Favouritedata(Get.find());
  Statesrequest statesrequest = Statesrequest.none;
  insertfavourit(int itemid) async {
    statesrequest = Statesrequest.loading;

    var response = await favouritedata.insertdata(
        myservecis.sharedPreferences.getInt("id")!, itemid);
    statesrequest = handlindata(response);
    if (statesrequest == Statesrequest.success) {
      if (response["status"] == "success") {
        print("success");
      }
    } else {
      statesrequest = Statesrequest.failur;
    }
    update();
  }

  deletefavourit(int itemid) async {
    statesrequest = Statesrequest.loading;

    var response = await favouritedata.removefavourite(
        myservecis.sharedPreferences.getInt("id")!, itemid);
    statesrequest = handlindata(response);
    if (statesrequest == Statesrequest.success) {
      if (response["status"] == "success") {
        print("success");
      }
    } else {
      statesrequest = Statesrequest.failur;
    }
    update();
  }

  Favouritepagedata favouritepagedata = Favouritepagedata(Get.find());

  List<FavouriteModel> fav = [];

  getfav() async {
    fav.clear();
    statesrequest = Statesrequest.loading;
   var response = await favouritepagedata
        .getdatafav(myservecis.sharedPreferences.getInt("id")!);
    statesrequest = handlindata(response);
    if (statesrequest == Statesrequest.success) {
      if (response["status"] == "success") {
        List listresponse = response["data"];
        fav.addAll(listresponse.map((e) => FavouriteModel.fromJson(e)));
        print("data/////////////////");
        print(fav);
      }
    } else {
      statesrequest = Statesrequest.failur;
    }
    update();
  }

  Deletfavcard deletfavcard = Deletfavcard(Get.find());
  deletfav(int favourite) {
    deletfavcard.deletdatafav(favourite);
    fav.removeWhere((e) => e.favouriteId == favourite);
  update();
  }

  @override
  void onInit() {
    getfav();
    super.onInit();
  }
}
