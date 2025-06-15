import 'package:ecommerce/core/funcation/curd.dart';
import 'package:ecommerce/linkapi.dart';

class Cartcoundata {
  Curd curd;
  Cartcoundata(this.curd);
  count(int userid, int itemid) async {
    var response = await curd.postdata(Apidata.cartcount,
        {"userid": userid.toString(),"itemid": itemid.toString(), });

    return response.fold((r) => r, (l) => l);
  }
}