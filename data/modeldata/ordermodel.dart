class OrederModel {
  int? ordreId;
  int? ordrerUserid;
  int? orderPrice;
  String? paymentmethod;
  String? orderType;
  int? orderDeleveryprice;
  int? orderCoupon;
  String? orderData;
  int? orderAdress;
  int? orderTotal;
  int? orderStatus;

  OrederModel(
      {this.ordreId,
      this.ordrerUserid,
      this.orderPrice,
      this.paymentmethod,
      this.orderType,
      this.orderDeleveryprice,
      this.orderCoupon,
      this.orderData,
      this.orderAdress,
      this.orderTotal,
      this.orderStatus});

  OrederModel.fromJson(Map<String, dynamic> json) {
    ordreId = json['ordre_id'];
    ordrerUserid = json['ordrer_userid'];
    orderPrice = json['order_price'];
    paymentmethod = json['paymentmethod'];
    orderType = json['order_type'];
    orderDeleveryprice = json['order_deleveryprice'];
    orderCoupon = json['order_coupon'];
    orderData = json['order_data'];
    orderAdress = json['order_adress'];
    orderTotal = json['order_total'];
    orderStatus = json['order_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ordre_id'] = ordreId;
    data['ordrer_userid'] = ordrerUserid;
    data['order_price'] = orderPrice;
    data['paymentmethod'] = paymentmethod;
    data['order_type'] = orderType;
    data['order_deleveryprice'] = orderDeleveryprice;
    data['order_coupon'] = orderCoupon;
    data['order_data'] = orderData;
    data['order_adress'] = orderAdress;
    data['order_total'] = orderTotal;
    data['order_status'] = orderStatus;
    return data;
  }
}