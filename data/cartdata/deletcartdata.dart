import 'package:ecommerce/core/funcation/curd.dart';
import 'package:ecommerce/linkapi.dart';

class Delercartdata {
  Curd curd;
  Delercartdata(this.curd);
  delet(int userid, int itemid) async {
    var response = await curd.postdata(Apidata.deletctcart,
        {"userid": userid.toString(), "itemid": itemid.toString()});
    return response.fold((r) => r, (l) => l);
  }
}
