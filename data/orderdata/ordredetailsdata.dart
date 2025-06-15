import 'package:ecommerce/core/funcation/curd.dart';
import 'package:ecommerce/linkapi.dart';

class Ordredetailsdata {
  Curd curd;
  Ordredetailsdata(this.curd);
  getdata(int userid) async {
    var response = await curd.postdata(Apidata.orderdetails, {"id": userid.toString()});
 return response.fold((left)=>left, (right)=>right); }
}
