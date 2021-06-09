import 'package:florist/screens/components/components.dart';

class Coupon {
  int id;
  String name;
  String image;
  String content;
  String code;
  String expiry;
  String discount;
  int active;
  String createdAt;
  String updatedAt;

  Coupon(
      {this.id,
        this.name,
        this.image,
        this.content,
        this.code,
        this.expiry,
        this.discount,
        this.active,
        this.createdAt,
        this.updatedAt});

  Coupon.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = Globals().urlImage + json['image'];
    content = json['content'];
    code = json['code'];
    expiry = json['expiry'];
    discount = json['discount'];
    active = json['active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['content'] = this.content;
    data['code'] = this.code;
    data['expiry'] = this.expiry;
    data['discount'] = this.discount;
    data['active'] = this.active;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
