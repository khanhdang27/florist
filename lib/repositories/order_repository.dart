import 'package:florist/models/models.dart';
import 'package:florist/repositories/repository.dart';

class OrderRepository extends Repository{
  Future<List<Order>> getAllOrder (int memberId) async {
    var response = await httpManager.get(url: '/api/order/$memberId');
    List data = response['data'];
    List<Order> results = data.map((e) {
      return Order.fromJson(e);
    }).toList();
    return results;
  }

  Future<Order> getOneOrder (int orderId) async {
    var response = await httpManager.get(url: '/api/order/getOne/$orderId');
    var data = response;
    Order results =  Order.fromJson(data);
    return results;
  }

  Future<int> addOrder({int bag_id, int subtotal, int total,}) async {
    var response = await httpManager.post(url: '/api/order', data: {
      'bag_id': bag_id,
      'subtotal': subtotal,
      'total': total,
    });
    return 1;
  }
}