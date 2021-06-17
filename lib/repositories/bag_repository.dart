import 'package:florist/library/shared_preferences.dart';
import 'package:florist/models/models.dart';
import 'package:florist/repositories/repository.dart';

class BagRepository extends Repository {
  Future<Map> getOne() async {
    var response = await httpManager.get(url: 'wp-json/wc/store/cart');
    String total = response['totals']['total_price'] ?? '0';
    Map results = {
      'bag': Bag.fromJson(response),
      'total': int.parse(total),
    };
    return results;
  }

  Future<int> updateBag(
      {int id, String name, String phone, String address, String pay}) async {
    var response = await httpManager.put(url: '/api/bag/$id', data: {
      'ship_name': name,
      'ship_phone': phone,
      'ship_address': address,
      'pay': pay,
    });
    await SharedPrefs.setBagId(response['id']);
    return response['id'];
  }
}