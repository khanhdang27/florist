import 'package:florist/configs/configs.dart';
import 'package:florist/models/models.dart';
import 'package:florist/repositories/repository.dart';

class WishlistItemRepository extends Repository {
  Future<int> addWishlist({int productId}) async {
    int response;
    if(appWishlist.appWishlistContainer.contains(productId)){
      response = await AppDb.dbLocal.deleteItemWL(
          productId:productId,
      );
      appWishlist.appWishlistContainer.remove(productId);
    }else{
      response = await AppDb.dbLocal.addItemWL(
          productId:productId,
          quantity: 1
      );
      appWishlist.appWishlistContainer.add(productId);
    }
    return response != null ? 1 : 0;
  }

  Future<int> changeQuantity({int wishlistItemId, int quantity}) async {
    var response = await httpManager.put(
        url: '/api/wish-list-item/$wishlistItemId',
        data: {'quantity': quantity});
    var total = response['total'];
    return int.parse(total);
  }

  Future<Map> deleteItem({int wishlistItemId}) async {
    var response =
        await httpManager.delete(url: '/api/wish-list-item/$wishlistItemId');
    var data = response['wishList'];
    String total = response['total'] ?? '0';
    Map results = {
      'wishlist': Wishlist.fromJson(data),
      'total': int.parse(total),
    };
    return results;
  }
}