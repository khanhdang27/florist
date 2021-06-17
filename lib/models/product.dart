/*
import 'package:florist/models/models.dart';
import 'package:florist/screens/components/components.dart';

class Product {
  int id;
  String name;
  int categoryId;
  int price;
  String image;
  String model;
  String description;
  String rating;
  int countRate;
  int active;
  String createdAt;
  String updatedAt;
  Category category;

  Product(
      {this.id,
        this.name,
        this.categoryId,
        this.price,
        this.image,
        this.model,
        this.description,
        this.rating,
        this.countRate,
        this.active,
        this.createdAt,
        this.updatedAt,
        this.category});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    categoryId = json['category_id'];
    price = json['price'];
    image = Globals().urlImage + json['image'];
    model = json['model'];
    description = json['description'];
    rating = json['rating'];
    countRate = json['count_rate'];
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
    data['price'] = this.price;
    data['image'] = this.image;
    data['model'] = this.model;
    data['description'] = this.description;
    data['rating'] = this.rating;
    data['count_rate'] = this.countRate;
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

class Product {
  int id;
  String name;
  int parent;
  String type;
  String variation;
  String permalink;
  String sku;
  String shortDescription;
  String description;
  bool onSale;
  Prices prices;
  String priceHtml;
  String averageRating;
  int reviewCount;
  List<Images> images;
  List<Category> categories;
  List<Tag> tags;
  bool hasOptions;
  bool isPurchasable;
  bool isInStock;
  bool isOnBackorder;
  bool soldIndividually;
  int quantityLimit;
  AddToCart addToCart;

  Product(
      {this.id,
      this.name,
      this.parent,
      this.type,
      this.variation,
      this.permalink,
      this.sku,
      this.shortDescription,
      this.description,
      this.onSale,
      this.prices,
      this.priceHtml,
      this.averageRating,
      this.reviewCount,
      this.images,
      this.categories,
      this.tags,
      this.hasOptions,
      this.isPurchasable,
      this.isInStock,
      this.isOnBackorder,
      this.soldIndividually,
      this.quantityLimit,
      this.addToCart});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    parent = json['parent'];
    type = json['type'];
    variation = json['variation'];
    permalink = json['permalink'];
    sku = json['sku'];
    shortDescription = json['short_description'];
    description = json['description'];
    onSale = json['on_sale'];
    prices =
        json['prices'] != null ? new Prices.fromJson(json['prices']) : null;
    priceHtml = json['price_html'];
    averageRating = json['average_rating'];
    reviewCount = json['review_count'];
    if (json['images'] != null) {
      images = [];
      json['images'].forEach((v) {
        images.add(new Images.fromJson(v));
      });
    }
    if (json['categories'] != null) {
      categories = [];
      json['categories'].forEach((v) {
        categories.add(new Category.fromJson(v));
      });
    }
    if (json['tags'] != null) {
      tags = [];
      json['tags'].forEach((v) {
        tags.add(new Tag.fromJson(v));
      });
    }
    hasOptions = json['has_options'];
    isPurchasable = json['is_purchasable'];
    isInStock = json['is_in_stock'];
    isOnBackorder = json['is_on_backorder'];
    soldIndividually = json['sold_individually'];
    quantityLimit = json['quantity_limit'];
    addToCart = json['add_to_cart'] != null
        ? new AddToCart.fromJson(json['add_to_cart'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['parent'] = this.parent;
    data['type'] = this.type;
    data['variation'] = this.variation;
    data['permalink'] = this.permalink;
    data['sku'] = this.sku;
    data['short_description'] = this.shortDescription;
    data['description'] = this.description;
    data['on_sale'] = this.onSale;
    if (this.prices != null) {
      data['prices'] = this.prices.toJson();
    }
    data['price_html'] = this.priceHtml;
    data['average_rating'] = this.averageRating;
    data['review_count'] = this.reviewCount;
    if (this.images != null) {
      data['images'] = this.images.map((v) => v.toJson()).toList();
    }
    if (this.categories != null) {
      data['categories'] = this.categories.map((v) => v.toJson()).toList();
    }
    if (this.tags != null) {
      data['tags'] = this.tags.map((v) => v.toJson()).toList();
    }
    data['has_options'] = this.hasOptions;
    data['is_purchasable'] = this.isPurchasable;
    data['is_in_stock'] = this.isInStock;
    data['is_on_backorder'] = this.isOnBackorder;
    data['sold_individually'] = this.soldIndividually;
    data['quantity_limit'] = this.quantityLimit;
    if (this.addToCart != null) {
      data['add_to_cart'] = this.addToCart.toJson();
    }
    return data;
  }
}
