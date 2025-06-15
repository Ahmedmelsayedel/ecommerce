import 'package:ecommerce/core/funcation/curd.dart';
import 'package:ecommerce/linkapi.dart';

class Deletfavcard {
  Curd curd;
  Deletfavcard(this.curd);
  deletdatafav(int userid) async {
    var response =
        await curd.postdata(Apidata.deletfavcard, {"id": userid.toString()});
    return response.fold((r) => r, (l) => l);
  }
}
