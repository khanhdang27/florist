import 'package:florist/models/models.dart';
import 'package:florist/repositories/repository.dart';

class CouponRepository extends Repository{
  Future<List<Coupon>> getAll() async {
    var response = await httpManager.get(url: '/api/coupon');
    List data = response['data'];
    List<Coupon> results = data.map((e) {
      return Coupon.fromJson(e);
    }).toList();

    return results;
  }
}