/*
import 'package:florist/models/models.dart';

class BannerDB{
  int id;
  String name;
  int categoryId;
  String image;
  String description;
  int active;
  String createdAt;
  String updatedAt;
  Category category;

  BannerDB(
      {this.id,
        this.name,
        this.categoryId,
        this.image,
        this.description,
        this.active,
        this.createdAt,
        this.updatedAt,
        this.category});

  BannerDB.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    categoryId = json['category_id'];
    image = json['image'];
    description = json['description'];
    active = json['active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['category_id'] = this.categoryId;
    data['image'] = this.image;
    data['description'] = this.description;
    data['active'] = this.active;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.category != null) {
      data['category'] = this.category.toJson();
    }
    return data;
  }
}*/
import 'package:florist/models/models.dart';

class BannerDB {
  int id;
  String name;
  String slug;
  String description;
  Images image;

  BannerDB({this.id, this.name, this.slug, this.description, this.image});

  BannerDB.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    description = json['description'];
    image = json['image'] != null ? new Images.fromJson(json['image']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['description'] = this.description;
    if (this.image != null) {
      data['image'] = this.image.toJson();
    }
    return data;
  }
}