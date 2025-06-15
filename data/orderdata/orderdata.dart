import 'package:ecommerce/core/funcation/curd.dart';
import 'package:ecommerce/linkapi.dart';

class Orderdata {
  Curd curd;
  Orderdata(this.curd);
  order(Map data) async {
    var response = await curd.postdata(Apidata.checkout, data);
    return response.fold((left)=>left, (right)=>right);
  }
}
