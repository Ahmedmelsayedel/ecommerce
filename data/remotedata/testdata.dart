
import 'package:ecommerce/core/funcation/curd.dart';
import 'package:ecommerce/linkapi.dart';

class Testdata {
  Curd curd;
  Testdata(this.curd);
  getdata() async {
    var response = await curd.postdata(Apidata.test, {});
   return response.fold((left)=>left, (right)=>right);
  }
}
