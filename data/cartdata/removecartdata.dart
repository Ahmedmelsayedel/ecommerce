import 'package:ecommerce/core/funcation/curd.dart';
import 'package:ecommerce/linkapi.dart';

class Removecartdata {
  Curd curd;
  Removecartdata(this.curd);
  removecart(int userid, int itemid) async {
    var response = await curd.postdata(Apidata.removecart, {
      "userid":userid.toString(),
      "itemid":itemid.toString()
    });
     return response.fold((r) => r, (l) => l);
  }
}
