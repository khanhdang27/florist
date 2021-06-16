import 'package:florist/blocs/blocs.dart';
import 'package:florist/models/models.dart';
import 'package:florist/repositories/repository.dart';

class BagItemRepository extends Repository {
  Future<int> addBagItem({int product_id, int quantity}) async {
    await httpManager.post(
        url: 'wp-json/wc/store/cart/add-item',
        data: {'id': product_id, 'quantity': quantity});
    return 1;
  }

  Future<int> addAllBagItem({int bag_id, int wishlist_id}) async {
    var response = await httpManager.post(url: '/api/bag-item/storeAll', data: {
      'bag_id': bag_id,
      'wishlist_id': wishlist_id,
    });
    AppBloc.bagBloc.add(BagGetOne());
    return 1;
  }

  Future<Map> bagChangeQuantity({String key, int quantity}) async {
    var response =
        await httpManager.post(url: 'wp-json/wc/store/cart/update-item', data: {
      'key': key,
      'quantity': quantity,
    });
  //  AppBloc.bagBloc.add(BagGetOne());
    String total = response['totals']['total_price'] ?? '0';
    Map results = {
      'bag': Bag.fromJson(response),
      'total': int.parse(total),
    };
    return results;
  }

  Future<Map> bagDeleteItem({String key}) async {
    var response =
        await httpManager.post(url: 'wp-json/wc/store/cart/remove-item', data: {
      'key': key,
    });
    String total = response['totals']['total_price'] ?? '0';
    Map results = {
      'bag': Bag.fromJson(response),
      'total': int.parse(total),
    };
    return results;
  }
}
