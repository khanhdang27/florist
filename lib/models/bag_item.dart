import 'package:florist/models/models.dart';

class BagItem {
  int id;
  int bagId;
  int productId;
  int quantity;
  String createdAt;
  String updatedAt;
  Product product;

  BagItem(
      {this.id,
        this.bagId,
        this.productId,
        this.quantity,
        this.createdAt,
        this.updatedAt,
        this.product});

  BagItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bagId = json['bag_id'];
    productId = json['product_id'];
    quantity = json['quantity'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    product =
    json['product'] != null ? new Product.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['bag_id'] = this.bagId;
    data['product_id'] = this.productId;
    data['quantity'] = this.quantity;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.product != null) {
      data['product'] = this.product.toJson();
    }
    return data;
  }
}