class FavouriteModel {
  int? favouriteId;
  int? favouriteItemid;
  int? favouriteUserid;
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
  int? userId;

  FavouriteModel(
      {this.favouriteId,
      this.favouriteItemid,
      this.favouriteUserid,
      this.itemId,
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
      this.userId});

  FavouriteModel.fromJson(Map<String, dynamic> json) {
    favouriteId = json['favourite_id'];
    favouriteItemid = json['favourite_itemid'];
    favouriteUserid = json['favourite_userid'];
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
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['favourite_id'] = favouriteId;
    data['favourite_itemid'] = favouriteItemid;
    data['favourite_userid'] = favouriteUserid;
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
    data['user_id'] = userId;
    return data;
  }
}