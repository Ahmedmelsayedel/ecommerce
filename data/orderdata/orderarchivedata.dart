import 'package:ecommerce/core/funcation/curd.dart';
import 'package:ecommerce/linkapi.dart';

class Ordrearchivesdata {
  Curd curd;
  Ordrearchivesdata(this.curd);
  getdata(int userid) async {
    var response = await curd.postdata(Apidata.orderarchive, {"id": userid.toString()});
 return response.fold((left)=>left, (right)=>right); }
}
