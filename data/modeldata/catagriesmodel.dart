class CatagriesModel {
  int? catagriesId;
  String? catagriesNameEn;
  String? catagriesNameAr;
  String? catagriesImage;
  String? catagriesDatatime;

  CatagriesModel(
      {this.catagriesId,
      this.catagriesNameEn,
      this.catagriesNameAr,
      this.catagriesImage,
      this.catagriesDatatime});

  CatagriesModel.fromJson(Map<String, dynamic> json) {
    catagriesId = json['catagries_id'];
    catagriesNameEn = json['catagries_name_en'];
    catagriesNameAr = json['catagries_name_ar'];
    catagriesImage = json['catagries_image'];
    catagriesDatatime = json['catagries_datatime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['catagries_id'] = this.catagriesId;
    data['catagries_name_en'] = this.catagriesNameEn;
    data['catagries_name_ar'] = this.catagriesNameAr;
    data['catagries_image'] = this.catagriesImage;
    data['catagries_datatime'] = this.catagriesDatatime;
    return data;
  }
}