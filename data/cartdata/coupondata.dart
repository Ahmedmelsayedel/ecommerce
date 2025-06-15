import 'package:ecommerce/core/funcation/curd.dart';
import 'package:ecommerce/linkapi.dart';

class Coupondata {
  Curd curd;
  Coupondata(this.curd);
  getcoupon(String couponname) async {
    var response = await curd.postdata(Apidata.coupon, {
       "name":couponname
    });
    return response.fold((r) => r, (l) => l);
  }
}
