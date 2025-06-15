import 'package:ecommerce/core/funcation/curd.dart';
import 'package:ecommerce/linkapi.dart';

class Deleteorderdata {
  Curd curd;
  Deleteorderdata(this.curd);
  getdata(int orderid) async {
    var response = await curd.postdata(Apidata.deleteorder, {"id": orderid.toString()});
 return response.fold((left)=>left, (right)=>right); }
}
