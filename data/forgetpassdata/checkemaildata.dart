import 'package:ecommerce/core/funcation/curd.dart';

import 'package:ecommerce/linkapi.dart';

class Checkemaildata {
  Curd curd;
  Checkemaildata(this.curd);
  postdatachekemail(String email) async {
    var response = await curd.postdata(Apidata.checkemail, {"email": email});
    return response.fold((r) => r, (l) => l);
  }
}
