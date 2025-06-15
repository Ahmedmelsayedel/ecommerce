import 'package:ecommerce/core/funcation/curd.dart';
import 'package:ecommerce/linkapi.dart';

class Offerdata {
  Curd curd;
  Offerdata(this.curd);
  getdata() async {
    var response = await curd.postdata(Apidata.offer, {});
     return response.fold((l) => l, (r) => r);
  }
}
