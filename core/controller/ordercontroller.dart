import 'package:ecommerce/core/funcation/handlingdata.dart';
import 'package:ecommerce/core/funcation/statesrequest.dart';
import 'package:ecommerce/core/servces/servecis.dart';
import 'package:ecommerce/data/model/ordermodel.dart';
import 'package:ecommerce/data/order/deleteorderdata.dart';
import 'package:ecommerce/data/order/orderarchivedata.dart';
import 'package:ecommerce/data/order/ordredetailsdata.dart';
import 'package:ecommerce/data/order/ratedata.dart';
import 'package:get/get.dart';

class Ordercontroller extends GetxController {
  List<OrederModel> data = [];

  Myservecis myservecis = Get.find();
  Statesrequest statesrequest = Statesrequest.none;
  Ordredetailsdata ordredetailsdata = Ordredetailsdata(Get.find());
  Deleteorderdata deleteorderdata = Deleteorderdata(Get.find());
  Ordrearchivesdata ordrearchivesdata = Ordrearchivesdata(Get.find());
  getorder() async {
    statesrequest = Statesrequest.loading;
    var response = await ordredetailsdata
        .getdata(myservecis.sharedPreferences.getInt("id")!);
    statesrequest = handlindata(response);
    if (statesrequest == Statesrequest.success) {
      if (response['status'] == "success") {
        List listresponse = response["data"];
        data.addAll(listresponse.map((e) => OrederModel.fromJson(e)));
        print(listresponse);
      }
    } else {
      statesrequest = Statesrequest.failur;
    }
    update();
  }

  String printorderstatus(int val) {
    if (val == 0) {
      return "pending";
    }
    if (val == 1) {
      return "pring done";
    }
    if (val == 2) {
      return "on the way";
    }
    if (val == 3) {
      return "recieve done";
    } else {
      return "cancelled";
    }
  }

  String couponstatus(int val) {
    if (val == 0) {
      return "none";
    } else {
      return "coupon is used";
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getorder();
  }

  deleteorder(int orderid) async {
    statesrequest = Statesrequest.loading;
    var response = await deleteorderdata.getdata(orderid);
    statesrequest = handlindata(response);
    if (statesrequest == Statesrequest.success) {
      if (response["status"] == "success") {
        data.removeWhere((e) => e.ordreId == orderid);
      } else {
        Get.snackbar("warning",
            "this order cant be deleted \n because it is in the way");
      }
    } else {
      statesrequest = Statesrequest.failur;
    }
    update();
  }
}
