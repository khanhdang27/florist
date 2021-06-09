import 'package:florist/configs/configs.dart';
import 'package:florist/models/models.dart';
import 'package:florist/repositories/repository.dart';

class WishlistItemRepository extends Repository {
  Future<int> addWishlist({int product_id}) async {
    int response;
    if(appWishlist.appWishlistContainer.contains(product_id)){
      response = await AppDb.dbLocal.deleteItemWL(
          productId:product_id,
      );
      appWishlist.appWishlistContainer.remove(product_id);
    }else{
      response = await AppDb.dbLocal.addItemWL(
          productId:product_id,
          quantity: 1
      );
      appWishlist.appWishlistContainer.add(product_id);
    }
    return response != null ? 1 : 0;
  }

  Future<int> changeQuantity({int wishlist_item_id, int quantity}) async {
    var response = await httpManager.put(
        url: '/api/wish-list-item/$wishlist_item_id',
        data: {'quantity': quantity});
    var total = response['total'];
    return int.parse(total);
  }

  Future<Map> deleteItem({int wishlist_item_id}) async {
    var response =
        await httpManager.delete(url: '/api/wish-list-item/$wishlist_item_id');
    var data = response['wishList'];
    String total = response['total'] ?? '0';
    Map results = {
      'wishlist': Wishlist.fromJson(data),
      'total': int.parse(total),
    };
    return results;
  }
}