import 'package:florist/models/models.dart';

class ProductWL {
  int productId;
  int quantity;


  ProductWL({this.productId, this.quantity});

  ProductWL.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['quantity'] = this.quantity;
    return data;
  }
}