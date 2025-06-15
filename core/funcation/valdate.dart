import 'package:get/get.dart';

valdator(String val, int min, int max, String type) {
  if (type == "username") {
    if (!GetUtils.isUsername(val)) {
      return "36".tr;
    }
  }
  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "37".tr;
    }
  }
  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return "38".tr;
    }
  }
  if (val.isEmpty) {
    return "39".tr;
  }
  if (val.length < min) {
    return "40".tr;
  }
  if (val.length > max) {
    return ;
  }
}
