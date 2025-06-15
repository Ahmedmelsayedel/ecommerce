import 'package:ecommerce/core/funcation/handlingdata.dart';
import 'package:ecommerce/core/funcation/statesrequest.dart';
import 'package:ecommerce/data/remote/testdata.dart';
import 'package:get/get.dart';

class Testcontroller extends GetxController {
  Testdata testdata = Testdata(Get.find());
  List data = [];
  late Statesrequest statesrequest;
  getData() async {
    statesrequest = Statesrequest.loading;
    var response = await testdata.getdata();
    statesrequest = handlindata(response);
    if (Statesrequest.success == statesrequest) {
      if (response["status"] == "success") {
        data.addAll(response["data"]);
      } else {
        statesrequest = Statesrequest.failur;
      }
    }
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
