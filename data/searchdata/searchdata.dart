import 'package:ecommerce/core/funcation/curd.dart';
import 'package:ecommerce/linkapi.dart';

class Searchdata {
  Curd curd;
  Searchdata(this.curd);
  select(String search) async {
    var response = await curd.postdata(Apidata.search, {"search": search});
    return response.fold((r) => r, (l) => l);
  }
}
