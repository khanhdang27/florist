import 'package:florist/models/models.dart';

class Order {
  int id;
  int bagId;
  int statusId;
  String subtotal;
  String total;
  String createdAt;
  String updatedAt;
  Bag bag;
  Status status;

  Order(
      {this.id,
        this.bagId,
        this.statusId,
        this.subtotal,
        this.total,
        this.createdAt,
        this.updatedAt,
        this.bag,
        this.status});

  Order.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bagId = json['bag_id'];
    statusId = json['status_id'];
    subtotal = json['subtotal'];
    total = json['total'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    bag = json['bag'] != null ? new Bag.fromJson(json['bag']) : null;
    status =
    json['status'] != null ? new Status.fromJson(json['status']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['bag_id'] = this.bagId;
    data['status_id'] = this.statusId;
    data['subtotal'] = this.subtotal;
    data['total'] = this.total;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.bag != null) {
      data['bag'] = this.bag.toJson();
    }
    if (this.status != null) {
      data['status'] = this.status.toJson();
    }
    return data;
  }
}