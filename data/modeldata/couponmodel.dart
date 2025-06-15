class CouponModel {
  int? couponId;
  String? couponName;
  int? couponDiscount;
  int? couponEnded;
  String? couponTime;

  CouponModel(
      {this.couponId,
      this.couponName,
      this.couponDiscount,
      this.couponEnded,
      this.couponTime});

  CouponModel.fromJson(Map<String, dynamic> json) {
    couponId = json['coupon_id'];
    couponName = json['coupon_name'];
    couponDiscount = json['coupon_discount'];
    couponEnded = json['coupon_ended'];
    couponTime = json['coupon_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['coupon_id'] = this.couponId;
    data['coupon_name'] = this.couponName;
    data['coupon_discount'] = this.couponDiscount;
    data['coupon_ended'] = this.couponEnded;
    data['coupon_time'] = this.couponTime;
    return data;
  }
}