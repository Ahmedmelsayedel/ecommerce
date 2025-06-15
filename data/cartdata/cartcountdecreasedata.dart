import 'package:ecommerce/core/funcation/curd.dart';
import 'package:ecommerce/linkapi.dart';

class Cartcountdecreasedata {
  Curd curd;
  Cartcountdecreasedata(this.curd);
  decrease(int itemid, int userid) async {
    var response = await curd.postdata(Apidata.decreasecart,
        {"itemid": itemid.toString(), "userid": userid.toString()});

   return response.fold((r) => r, (l) => l);
  }
}