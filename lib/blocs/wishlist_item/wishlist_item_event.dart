part of 'wishlist_item_bloc.dart';

@immutable
abstract class WishlistItemEvent {}

class AddWishlist extends WishlistItemEvent {
  final int wishlistId;
  final int productId;
  final int quantity;

  AddWishlist({this.wishlistId, this.productId, this.quantity});
}

class ChangeQuantity extends WishlistItemEvent {
  final int quantity;
  final int id;

  ChangeQuantity({this.quantity, this.id});
}

class DeleteItem extends WishlistItemEvent {
  final int id;
  final int productId;

  DeleteItem({this.id,this.productId});
}
