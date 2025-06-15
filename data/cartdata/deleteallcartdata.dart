import 'package:ecommerce/core/funcation/curd.dart';
import 'package:ecommerce/linkapi.dart';

class Deleteallcartdata {
  Curd curd;
  Deleteallcartdata(this.curd);
  deletelall(int id) async {
    var response = await curd.postdata(Apidata.deleteallcart, {"id": id.toString()});
    return response.fold((r) => r, (l) => l);
  }
}
