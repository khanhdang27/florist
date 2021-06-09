part of 'wishlist_bloc.dart';

@immutable
abstract class WishlistState extends Equatable {}

class WishlistInitial extends WishlistState {
  @override
  List<Object> get props => [];
}

class WishlistGetOneSuccess extends WishlistState {
  final Wishlist item;
  final int total;
  final int diff;

  WishlistGetOneSuccess({this.item, this.total, this.diff = 0});

  @override
  List<Object> get props => [item, total, diff];
}

class WishlistGetOneFailed extends WishlistState {
  @override
  List<Object> get props => [];
}
