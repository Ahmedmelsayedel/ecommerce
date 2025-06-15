import 'dart:ffi';

class ItemModel {
  int? itemId;
  String? itemNameEn;
  String? itemNameAr;
  String? itemDescEn;
  String? itemDescAr;
  String? itemImage;
  int? itemCount;
  int? itemActive;
  int? itemPrice;
  int? itemDiscount;
  String? itemDatatime;
  int? itemCatagries;
  int? catagriesId;
  String? catagriesNameEn;
  String? catagriesNameAr;
  String? catagriesImage;
  String? catagriesDatatime;
  int? favourite;
  int? priceDiscount;

  ItemModel(
      {this.itemId,
      this.itemNameEn,
      this.itemNameAr,
      this.itemDescEn,
      this.itemDescAr,
      this.itemImage,
      this.itemCount,
      this.itemActive,
      this.itemPrice,
      this.itemDiscount,
      this.itemDatatime,
      this.itemCatagries,
      this.catagriesId,
      this.catagriesNameEn,
      this.catagriesNameAr,
      this.catagriesImage,
      this.catagriesDatatime,
      this.favourite
      ,this.priceDiscount});

  ItemModel.fromJson(Map<String, dynamic> json) {
    itemId = json['item_id'];
    itemNameEn = json['item_name_en'];
    itemNameAr = json['item_name_ar'];
    itemDescEn = json['item_desc_en'];
    itemDescAr = json['item_desc_ar'];
    itemImage = json['item_image'];
    itemCount = json['item_count'];
    itemActive = json['item_active'];
    itemPrice = json['item_price'];
    itemDiscount = json['item_discount'];
    itemDatatime = json['item_datatime'];
    itemCatagries = json['item_catagries'];
    catagriesId = json['catagries_id'];
    catagriesNameEn = json['catagries_name_en'];
    catagriesNameAr = json['catagries_name_ar'];
    catagriesImage = json['catagries_image'];
    catagriesDatatime = json['catagries_datatime'];
    favourite = json['favourite'];
    priceDiscount = json['pricediscount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['item_id'] = itemId;
    data['item_name_en'] = itemNameEn;
    data['item_name_ar'] = itemNameAr;
    data['item_desc_en'] = itemDescEn;
    data['item_desc_ar'] = itemDescAr;
    data['item_image'] = itemImage;
    data['item_count'] = itemCount;
    data['item_active'] = itemActive;
    data['item_price'] = itemPrice;
    data['item_discount'] = itemDiscount;
    data['item_datatime'] = itemDatatime;
    data['item_catagries'] = itemCatagries;
    data['catagries_id'] = catagriesId;
    data['catagries_name_en'] = catagriesNameEn;
    data['catagries_name_ar'] = catagriesNameAr;
    data['catagries_image'] = catagriesImage;
    data['catagries_datatime'] = catagriesDatatime;
    data['favourite'] = favourite;
   
    return data;
  }
}
