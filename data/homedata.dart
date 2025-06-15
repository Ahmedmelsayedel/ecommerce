import 'package:ecommerce/core/funcation/curd.dart';
import 'package:ecommerce/linkapi.dart';

class HomeData {
  Curd curd;
  HomeData(this.curd);
  getdata() async {
    var response = await curd.postdata(Apidata.homepage, {});
    return response.fold((l) => l, (r) => r);
  }
}
