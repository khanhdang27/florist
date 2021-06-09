part of 'wishlist_bloc.dart';

@immutable
abstract class WishlistEvent {}
class WishlistGetOne extends WishlistEvent {
  final int id;

  WishlistGetOne({this.id});
}

class WishlistGetAll extends WishlistEvent {}

/*
class WishlistDelete extends WishlistEvent {
  final int id;
  final int total;

  WishlistDelete({this.id, this.total});
}
*/
