import 'package:ecommerce/core/funcation/curd.dart';
import 'package:ecommerce/linkapi.dart';

class Itemsdata {
  Curd curd;
  Itemsdata(this.curd);
  getdata(String id , int userid) async {
    var response = await curd.postdata(Apidata.items, {
      "id":id.toString(),
      "userid": userid.toString()
    });
    return response.fold((l) => l, (r) => r);
    
  }
  
}
