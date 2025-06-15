import 'package:ecommerce/core/funcation/statesrequest.dart';

handlindata(response) {
  if (response is Statesrequest) {
    return response;
  } else {
    return Statesrequest.success;
  }
}
