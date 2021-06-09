
import 'package:florist/models/models.dart';

class Bag {
  List<Coupon> coupons;
  List<ShippingRates> shippingRates;
  ShippingAddress shippingAddress;
  List<Items> items;
  int itemsCount;
  int itemsWeight;
  bool needsPayment;
  bool needsShipping;
  Totals totals;

  Bag(
      {this.coupons,
        this.shippingRates,
        this.shippingAddress,
        this.items,
        this.itemsCount,
        this.itemsWeight,
        this.needsPayment,
        this.needsShipping,
        this.totals});

  Bag.fromJson(Map<String, dynamic> json) {
    if (json['coupons'] != null) {
      coupons = new List<Coupon>();
      json['coupons'].forEach((v) {
        coupons.add(new Coupon.fromJson(v));
      });
    }
    if (json['shipping_rates'] != null) {
      shippingRates = new List<ShippingRates>();
      json['shipping_rates'].forEach((v) {
        shippingRates.add(new ShippingRates.fromJson(v));
      });
    }
    shippingAddress = json['shipping_address'] != null
        ? new ShippingAddress.fromJson(json['shipping_address'])
        : null;
    if (json['items'] != null) {
      items = new List<Items>();
      json['items'].forEach((v) {
        items.add(new Items.fromJson(v));
      });
    }
    itemsCount = json['items_count'];
    itemsWeight = json['items_weight'];
    needsPayment = json['needs_payment'];
    needsShipping = json['needs_shipping'];
    totals =
    json['totals'] != null ? new Totals.fromJson(json['totals']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.coupons != null) {
      data['coupons'] = this.coupons.map((v) => v.toJson()).toList();
    }
    if (this.shippingRates != null) {
      data['shipping_rates'] =
          this.shippingRates.map((v) => v.toJson()).toList();
    }
    if (this.shippingAddress != null) {
      data['shipping_address'] = this.shippingAddress.toJson();
    }
    if (this.items != null) {
      data['items'] = this.items.map((v) => v.toJson()).toList();
    }
    data['items_count'] = this.itemsCount;
    data['items_weight'] = this.itemsWeight;
    data['needs_payment'] = this.needsPayment;
    data['needs_shipping'] = this.needsShipping;
    if (this.totals != null) {
      data['totals'] = this.totals.toJson();
    }
    return data;
  }
}