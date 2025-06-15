import 'package:ecommerce/core/funcation/curd.dart';

import 'package:ecommerce/linkapi.dart';

class Verifycodedata {
  Curd curd;
  Verifycodedata(this.curd);
  postverifycode(String email, String verifycode) async {
    var response = await curd.postdata(
        Apidata.verifycode, {"email": email, "verifycode": verifycode});
    return response.fold((r) => r, (l) => l);
  }
}
