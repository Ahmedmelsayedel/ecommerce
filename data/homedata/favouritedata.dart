import 'package:ecommerce/core/funcation/curd.dart';
import 'package:ecommerce/linkapi.dart';

class Favouritedata {
  Curd curd;
  Favouritedata(this.curd);
  insertdata(int userid, int itemid) async {
    var response = await curd
        .postdata(Apidata.favourite, {"userid": userid.toString(), "itemid": itemid.toString()});
    return response.fold((l) => l, (r) => r);
  }
   removefavourite(int userid, int itemid) async {
    var response = await curd
        .postdata(Apidata.deletfavourite, {"userid": userid.toString(), "itemid": itemid.toString()});
    return response.fold((l) => l, (r) => r);
  }
}
