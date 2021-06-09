import 'package:florist/models/models.dart';

class Wishlist {
  int id;
  int memberId;
  int active;
  String createdAt;
  String updatedAt;
  List<WishlistItem> wishListItem;
  Member member;

  Wishlist(
      {this.id,
        this.memberId,
        this.active,
        this.createdAt,
        this.updatedAt,
        this.wishListItem,
        this.member});

  Wishlist.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    memberId = json['member_id'];
    active = json['active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['wish_list_item'] != null) {
      wishListItem = new List<WishlistItem>();
      json['wish_list_item'].forEach((v) {
        wishListItem.add(new WishlistItem.fromJson(v));
      });
    }
    member = json['member'] != null ? new Member.fromJson(json['member']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['member_id'] = this.memberId;
    data['active'] = this.active;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.wishListItem != null) {
      data['wish_list_item'] =
          this.wishListItem.map((v) => v.toJson()).toList();
    }
    if (this.member != null) {
      data['member'] = this.member.toJson();
    }
    return data;
  }
}
