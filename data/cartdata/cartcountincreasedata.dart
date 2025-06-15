import 'package:ecommerce/core/funcation/curd.dart';
import 'package:ecommerce/linkapi.dart';

class Cartcountincreasedata {
  Curd curd;
  Cartcountincreasedata(this.curd);
  increase(int itemid, int userid) async {
    var response = await curd.postdata(Apidata.increasecart,
        {"itemid": itemid.toString(), "userid": userid.toString()});

    return response.fold((r) => r, (l) => l);
  }
}

