import 'package:florist/models/models.dart';

class CouponMember {
  int id;
  int couponId;
  int memberId;
  String createdAt;
  String updatedAt;
  Coupon coupon;
  Member member;

  CouponMember(
      {this.id,
        this.couponId,
        this.memberId,
        this.createdAt,
        this.updatedAt,
        this.coupon,
        this.member});

  CouponMember.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    couponId = json['coupon_id'];
    memberId = json['member_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    coupon =
    json['coupon'] != null ? new Coupon.fromJson(json['coupon']) : null;
    member =
    json['member'] != null ? new Member.fromJson(json['member']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['coupon_id'] = this.couponId;
    data['member_id'] = this.memberId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.coupon != null) {
      data['coupon'] = this.coupon.toJson();
    }
    if (this.member != null) {
      data['member'] = this.member.toJson();
    }
    return data;
  }
}