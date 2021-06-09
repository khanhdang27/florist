import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:florist/blocs/blocs.dart';
import 'package:florist/configs/app_wishlist.dart';
import 'package:florist/configs/configs.dart';
import 'package:florist/models/models.dart';
import 'package:florist/repositories/wishlist_item_repository.dart';
import 'package:meta/meta.dart';

part 'wishlist_item_event.dart';

part 'wishlist_item_state.dart';

class WishlistItemBloc extends Bloc<WishlistItemEvent, WishlistItemState> {
  WishlistItemBloc() : super(WishlistItemInitial());
  final WishlistItemRepository wishlistItemRepository =
      WishlistItemRepository();

  @override
  Stream<WishlistItemState> mapEventToState(
    WishlistItemEvent event,
  ) async* {
    if (event is AddWishlist) {
      int stt = await wishlistItemRepository.addWishlist(
          product_id: event.product_id,
      );
      if (stt == 1) {
        yield AddWishlistSuccess();
      } else {
        yield AddWishlistFailed();
      }
    }

    if (event is ChangeQuantity) {
      int total = await wishlistItemRepository.changeQuantity(
          wishlist_item_id: event.id, quantity: event.quantity);
      if (total != null) {
        yield ChangeQuantitySuccess(
          total: total,
        );
      } else {
        yield ChangeQuantityFailed();
      }
    }
/*
    if (event is DeleteItem) {
      Map wishList = await wishlistItemRepository.deleteItem(
          wishlist_item_id: event.id); //item con lai, total
      WishlistState wishlistState = AppBloc.wishlistBloc.state;
      if (wishlistState is WishlistGetOneSuccess) {
        appWishlist.appWishlistContainer.remove(event.product_id);
        AppBloc.wishlistBloc
            .add(WishlistDelete(id: event.id, total: wishList['total']));
      }
      yield DeleteItemSuccess();
    }*/
  }
}
