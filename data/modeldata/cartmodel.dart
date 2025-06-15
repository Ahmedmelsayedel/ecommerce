class CartModel {
  int? totalprice;
  int? cartcount;
  int? cartid;
  int? cartUserid;
  int? cartItemid;
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

  CartModel(
      {this.totalprice,
      this.cartcount,
      this.cartid,
      this.cartUserid,
      this.cartItemid,
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
      this.itemCatagries});

  CartModel.fromJson(Map<String, dynamic> json) {
    totalprice = json['totalprice'];
    cartcount = json['cartcount'];
    cartid = json['cartid'];
    cartUserid = json['cart_userid'];
    cartItemid = json['cart_itemid'];
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalprice'] = this.totalprice;
    data['cartcount'] = this.cartcount;
    data['cartid'] = this.cartid;
    data['cart_userid'] = this.cartUserid;
    data['cart_itemid'] = this.cartItemid;
    data['item_id'] = this.itemId;
    data['item_name_en'] = this.itemNameEn;
    data['item_name_ar'] = this.itemNameAr;
    data['item_desc_en'] = this.itemDescEn;
    data['item_desc_ar'] = this.itemDescAr;
    data['item_image'] = this.itemImage;
    data['item_count'] = this.itemCount;
    data['item_active'] = this.itemActive;
    data['item_price'] = this.itemPrice;
    data['item_discount'] = this.itemDiscount;
    data['item_datatime'] = this.itemDatatime;
    data['item_catagries'] = this.itemCatagries;
    return data;
  }
}