import 'package:ecommerce/core/funcation/curd.dart';

import 'package:ecommerce/linkapi.dart';

class Resetpassworddata {
  Curd curd;
  Resetpassworddata(this.curd);
  postRestpassword(String email, String password) async {
    var response = await curd.postdata(
        Apidata.resetpassword, {"email": email, "password": password});
    return response.fold((l) => l, (r) => r);
  }
}
