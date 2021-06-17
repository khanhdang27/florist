import 'package:florist/models/models.dart';

class Items {
  String key;
  int id;
  int quantity;
  int quantityLimit;
  String name;
  String shortDescription;
  String description;
  String sku;
  bool backordersAllowed;
  bool showBackorderBadge;
  bool soldIndividually;
  String permalink;
  List<Images> images;
  Prices prices;
  Totals totals;

  Items(
      {this.key,
        this.id,
        this.quantity,
        this.quantityLimit,
        this.name,
        this.shortDescription,
        this.description,
        this.sku,
        this.backordersAllowed,
        this.showBackorderBadge,
        this.soldIndividually,
        this.permalink,
        this.images,
        this.prices,
        this.totals});

  Items.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    id = json['id'];
    quantity = json['quantity'];
    quantityLimit = json['quantity_limit'];
    name = json['name'];
    shortDescription = json['short_description'];
    description = json['description'];
    sku = json['sku'];
    backordersAllowed = json['backorders_allowed'];
    showBackorderBadge = json['show_backorder_badge'];
    soldIndividually = json['sold_individually'];
    permalink = json['permalink'];
    if (json['images'] != null) {
      images = [];
      json['images'].forEach((v) {
        images.add(new Images.fromJson(v));
      });
    }
    prices =
    json['prices'] != null ? new Prices.fromJson(json['prices']) : null;
    totals =
    json['totals'] != null ? new Totals.fromJson(json['totals']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['key'] = this.key;
    data['id'] = this.id;
    data['quantity'] = this.quantity;
    data['quantity_limit'] = this.quantityLimit;
    data['name'] = this.name;
    data['short_description'] = this.shortDescription;
    data['description'] = this.description;
    data['sku'] = this.sku;
    data['backorders_allowed'] = this.backordersAllowed;
    data['show_backorder_badge'] = this.showBackorderBadge;
    data['sold_individually'] = this.soldIndividually;
    data['permalink'] = this.permalink;
    if (this.images != null) {
      data['images'] = this.images.map((v) => v.toJson()).toList();
    }
    if (this.prices != null) {
      data['prices'] = this.prices.toJson();
    }
    if (this.totals != null) {
      data['totals'] = this.totals.toJson();
    }
    return data;
  }
}