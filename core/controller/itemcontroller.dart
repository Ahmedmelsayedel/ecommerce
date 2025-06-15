import 'package:ecommerce/controller/homepagecontroller.dart';
import 'package:ecommerce/core/funcation/handlingdata.dart';
import 'package:ecommerce/core/funcation/statesrequest.dart';
import 'package:ecommerce/core/servces/servecis.dart';
import 'package:ecommerce/data/home/favouritedata.dart';
import 'package:ecommerce/data/home/itemsdata.dart';
import 'package:ecommerce/data/model/itemmodle.dart';
import 'package:ecommerce/data/model/pagemodel.dart';
import 'package:get/get.dart';

abstract class Itemcontroller extends Searchmixcontroller {
  changeitemcount(int val);
  getdata(String id, int userid);
  changid(String itemid);
  gotoproduction(ItemModel itemModel);
}

class Itemcontrollerimp extends Itemcontroller {
  Favouritedata favouritedata = Favouritedata(Get.find());
  String? catagriesid;
  List catagries = [];
  int? userid;
  int? itemcount;
  Itemsdata itemsdata = Itemsdata(Get.find());
  List data = [];
 
  Myservecis myservecis = Get.find();


  @override
  @override
  void onInit() {
    Map? arguments = Get.arguments;
    if (arguments != null) {
      userid = myservecis.sharedPreferences.getInt("id");
      catagries = arguments["catagries"];
      itemcount = arguments["itemcount"];
      catagriesid = arguments["catagriesid"];
      print("===========================$catagriesid");
      getdata(catagriesid!, userid!);
    }
    super.onInit();
  }

  @override
  changeitemcount(int val) {
    itemcount = val;
    update();
  }

  @override
  getdata(id, userid) async {
    data.clear();
    statesrequest = Statesrequest.loading;

    var response = await itemsdata.getdata(id, userid);
    statesrequest = handlindata(response);
    if (statesrequest == Statesrequest.success) {
      if (response["status"] == "success") {
        data.addAll(response["data"]);
      }
    } else {
      statesrequest = Statesrequest.failur;
    }
    update();
  }

  @override
  changid(String itemid) {
    catagriesid = itemid;
    getdata(catagriesid!, userid!);
    update();
  }

  @override
  gotoproduction(itemModel) {
    Get.toNamed(Appdata.productdetails, arguments: {"itemmodel": itemModel});
  }
}
