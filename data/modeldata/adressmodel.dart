class AdressModel {
  int? adressid;
  int? userId;
  String? city;
  String? street;

  AdressModel({this.adressid, this.userId, this.city, this.street});

  AdressModel.fromJson(Map<String, dynamic> json) {
    adressid = json['adressid'];
    userId = json['user_id'];
    city = json['city'];
    street = json['street'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['adressid'] = this.adressid;
    data['user_id'] = this.userId;
    data['city'] = this.city;
    data['street'] = this.street;
    return data;
  }
}