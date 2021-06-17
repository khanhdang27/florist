import 'package:florist/models/models.dart';
import 'package:florist/repositories/repository.dart';

class ShippingRepository extends Repository {
  Future<Shipping> getOne({int id}) async {
    var response = await httpManager.get(url: '/wp-json/wc/v3/customers/$id');
    print(response.toString());
    Shipping results = Shipping.fromJson(response['billing']);
    return results;
  }

  Future<int> updateShipping(
      {int id, String name, String email, String phone, String address}) async {
    await httpManager.put(url: '/api/shipping/$id', data: {
      'name': name,
      'email': email,
      'phone': phone,
      'address': address,
    });
    return 1;
  }
}
