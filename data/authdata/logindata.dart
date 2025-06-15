import 'package:ecommerce/core/funcation/curd.dart';
import 'package:ecommerce/linkapi.dart';

class Logindata {
  Curd curd;
  Logindata(this.curd);
  postLoginData(email, password) async {
    var response = await curd
        .postdata(Apidata.login, {"email": email, "password": password});
    return response.fold((l) => l, (r) => r);
  }
}
