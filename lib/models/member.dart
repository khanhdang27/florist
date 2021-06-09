import 'package:florist/models/models.dart';

class Member {
  int id;
  String name;
  String slug;
  AvatarUrls avatarUrls;

  Member({this.id, this.name, this.slug, this.avatarUrls});

  Member.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    avatarUrls = json['avatar_urls'] != null
        ? new AvatarUrls.fromJson(json['avatar_urls'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    if (this.avatarUrls != null) {
      data['avatar_urls'] = this.avatarUrls.toJson();
    }
    return data;
  }
}