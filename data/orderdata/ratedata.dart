import 'package:ecommerce/core/funcation/curd.dart';
import 'package:ecommerce/linkapi.dart';

class Ratedata {
  Curd curd;
  Ratedata(this.curd);
  update(int id, double rate, String note)async {
    var response =await curd.postdata(Apidata.updaterate, {
      "id": id.toString(),
      "rate": rate.toString(),
      "note": note.toString()
    }  
    );
  return response.fold((left)=>left, (right)=>right);
  }
}
