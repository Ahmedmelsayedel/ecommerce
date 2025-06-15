import 'package:ecommerce/core/funcation/curd.dart';
import 'package:ecommerce/linkapi.dart';

class Getcartdata {
  Curd curd;
  Getcartdata (this.curd);
  select(int userid) async {
    var response = await curd.postdata(Apidata.selectcart,
        {"userid": userid.toString(), });
    return response.fold((r) => r, (l) => l);
  }
}