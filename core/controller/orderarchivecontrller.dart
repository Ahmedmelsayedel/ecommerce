import 'package:ecommerce/core/funcation/handlingdata.dart';
import 'package:ecommerce/core/funcation/statesrequest.dart';
import 'package:ecommerce/core/servces/servecis.dart';
import 'package:ecommerce/data/model/ordermodel.dart';
import 'package:ecommerce/data/order/orderarchivedata.dart';
import 'package:ecommerce/data/order/ratedata.dart';
import 'package:get/get.dart';

class Orderarchivecontrller extends GetxController {
  List<OrederModel> data = [];
  Ratedata ratedata = Ratedata(Get.find());
  Statesrequest statesrequest = Statesrequest.none;
  Ordrearchivesdata ordrearchivesdata = Ordrearchivesdata(Get.find());
  Myservecis myservecis = Get.find();
  int? orderid;
  getorderarchive() async {
    data.clear();
    statesrequest = Statesrequest.loading;
    update();
    var response = await ordrearchivesdata
        .getdata(myservecis.sharedPreferences.getInt("id")!);
    statesrequest = handlindata(response);
    if (statesrequest == Statesrequest.success) {
      if (response['status'] == "success") {
        List listresponse = response["data"];
        orderid = listresponse[0]["ordre_id"];
        data.addAll(listresponse.map((e) => OrederModel.fromJson(e)));
        print(listresponse);
      }
    } else {
      statesrequest = Statesrequest.failur;
    }
    update();
  }

  @override
  void onInit() {
    getorderarchive();
    super.onInit();
  }

  String printorderstatus(int val) {
    if (val == 0) {
      return "pending";
    }
    if (val == 1) {
      return "delivered";
    }
    if (val == 2) {
      return "delivery done";
    } else {
      return "cancelled";
    }
  }

  String couponstatus1(int val) {
    if (val == 0) {
      return "none";
    } else {
      return "coupon is used";
    }
  }

  updatrate(double rate, String note) async {
    data.clear();
    statesrequest = Statesrequest.loading;
    var response = await ratedata.update(orderid!, rate, note);
    statesrequest = handlindata(response);
    if (statesrequest == Statesrequest.success) {
      if (response["status"] == "success") {
        getorderarchive();
      }
    } else {
      statesrequest = Statesrequest.failur;
    }
  }
}
