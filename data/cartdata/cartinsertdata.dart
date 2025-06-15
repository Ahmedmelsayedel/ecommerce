import 'package:ecommerce/core/funcation/curd.dart';
import 'package:ecommerce/linkapi.dart';

class Cartinsertdata {
  Curd curd;
  Cartinsertdata(this.curd);
  insert(int userid, int itemid) async {
    var response = await curd.postdata(Apidata.insertcart,
        {"userid": userid.toString(), "itemid": itemid.toString()});
    return response.fold((r) => r, (l) => l);
  }
}
