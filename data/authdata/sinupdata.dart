import 'package:ecommerce/core/funcation/curd.dart';
import 'package:ecommerce/linkapi.dart';

class Sinupdata {
  Curd curd;
  Sinupdata(this.curd);

  postdata2(String username, String email, String phone, String password) async {
    var response = await curd.postdata(Apidata.singup, {
      "username": username,
      "email": email,
      "phone": phone,
      "password": password,
    });
        print("==========$response");
   return  response.fold((l) => l, (r) => r);

  }
 
}
