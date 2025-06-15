import 'package:ecommerce/core/funcation/curd.dart';
import 'package:ecommerce/linkapi.dart';

class AddAdressdata {
  Curd curd;
  AddAdressdata(this.curd);
  add(int userid, String city, String street) async {
    var response = await curd.postdata(Apidata.addadress, {
      "userid":userid.toString(),
      "city":city,
      "street":street

    });
       return response.fold((r) => r, (l) => l);
  }
}
class UpdateAdressdata {
   Curd curd;
  UpdateAdressdata(this.curd);
  update(int adressid, String city, String street) async {
    var response = await curd.postdata(Apidata.updateadress, {
      "adressid":adressid.toString(),
      "city":city,
      "street":street

    });
       return response.fold((r) => r, (l) => l);
  }
}
class DeleteAdressdata {
  Curd curd;
  DeleteAdressdata(this.curd);
  delete(int adressid) async {
    var response = await curd.postdata(Apidata.deletadress, {
      "id":adressid.toString(),
    

    });
       return response.fold((r) => r, (l) => l);
  }
}
class ViewAdressdata {
  Curd curd;
  ViewAdressdata(this.curd);
  view(int userid) async {
    var response = await curd.postdata(Apidata.viewadress, {
      "userid":userid.toString(),
     

    });
       return response.fold((r) => r, (l) => l);
  }
}
