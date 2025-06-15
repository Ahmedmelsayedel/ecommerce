import 'package:ecommerce/core/funcation/curd.dart';
import 'package:ecommerce/linkapi.dart';

class Verifydata {
  Curd curd;
  Verifydata(this.curd);
  postverify(String email, String verify) async {
    var resposne = await curd
        .postdata(Apidata.verify, {"email": email, "verifycode": verify});
    print(resposne);
    return resposne.fold((l) => l, (r) => r);
  }
}
