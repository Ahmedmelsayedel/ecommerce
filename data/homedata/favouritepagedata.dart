import 'package:ecommerce/core/funcation/curd.dart';
import 'package:ecommerce/linkapi.dart';

class Favouritepagedata {
  Curd curd;
  Favouritepagedata(this.curd);
  getdatafav(int userid) async {
    var response =
        await curd.postdata(Apidata.favouritepage, {"userid": userid.toString()});
    return response.fold((r) => r, (l) => l);
  }
}
