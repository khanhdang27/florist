import 'package:florist/models/models.dart';

class ShippingRates {
  int packageId;
  String name;
  Destination destination;
  List<Items> items;

  ShippingRates(
      {this.packageId,
        this.name,
        this.destination,
        this.items,});

  ShippingRates.fromJson(Map<String, dynamic> json) {
    packageId = json['package_id'];
    name = json['name'];
    destination = json['destination'] != null
        ? new Destination.fromJson(json['destination'])
        : null;
    if (json['items'] != null) {
      items = [];
      json['items'].forEach((v) {
        items.add(new Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['package_id'] = this.packageId;
    data['name'] = this.name;
    if (this.destination != null) {
      data['destination'] = this.destination.toJson();
    }
    if (this.items != null) {
      data['items'] = this.items.map((v) => v.toJson()).toList();
    }
    return data;
  }
}