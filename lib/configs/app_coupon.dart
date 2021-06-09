import 'package:florist/models/models.dart';

final AppCoupon appCoupon = AppCoupon();

class AppCoupon {
  List<Coupon> appCouponContainer = [];

  static final AppCoupon _instance = AppCoupon._internal();

  factory AppCoupon() {
    return _instance;
  }

  AppCoupon._internal();
}
