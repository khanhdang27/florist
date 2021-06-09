part of 'wishlist_item_bloc.dart';

@immutable
abstract class WishlistItemState {}

class WishlistItemInitial extends WishlistItemState {}

class AddWishlistSuccess extends WishlistItemState{}
class AddWishlistFailed extends WishlistItemState{}

class ChangeQuantitySuccess extends WishlistItemState{
  final int total;

  ChangeQuantitySuccess({this.total});
}
class ChangeQuantityFailed extends WishlistItemState{}

class DeleteItemSuccess extends WishlistItemState{
  final Wishlist item;

  DeleteItemSuccess({this.item});
}
class DeleteItemFailed extends WishlistItemState{}

