part of 'wishlist_item_bloc.dart';

@immutable
abstract class WishlistItemEvent {}

class AddWishlist extends WishlistItemEvent {
  final int wishlist_id;
  final int product_id;
  final int quantity;

  AddWishlist({this.wishlist_id, this.product_id, this.quantity});
}

class ChangeQuantity extends WishlistItemEvent {
  final int quantity;
  final int id;

  ChangeQuantity({this.quantity, this.id});
}

class DeleteItem extends WishlistItemEvent {
  final int id;
  final int product_id;

  DeleteItem({this.id,this.product_id});
}
