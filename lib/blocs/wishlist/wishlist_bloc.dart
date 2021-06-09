import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:florist/blocs/blocs.dart';
import 'package:florist/configs/configs.dart';
import 'package:florist/models/models.dart';
import 'package:florist/repositories/wishlist_repository.dart';
import 'package:meta/meta.dart';

part 'wishlist_event.dart';

part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial());
  final WishlistRepository wishlistRepository = WishlistRepository();

  @override
  Stream<WishlistState> mapEventToState(WishlistEvent event) async* {
   /* if (event is WishlistGetOne) {
      Map result = await wishlistRepository.getOne(id: event.id);
      Wishlist wishlist = result['wishlist'];
      appWishlist.appWishlistContainer.clear();
      for (WishlistItem item in wishlist.wishListItem) {
        appWishlist.appWishlistContainer.add(item.productId);
      }
      if (true) {
        yield WishlistGetOneSuccess(
          item: result['wishlist'],
          total: result['total'],
        );
      } else {
        yield WishlistGetOneFailed();
      }
    }

    if (event is WishlistDelete) {
      var currentState = state; //WishlistGetOneSuccess
      if (currentState is WishlistGetOneSuccess) {
        currentState.item.wishListItem.removeWhere((element) {
          return element.id == event.id;
        });
        yield WishlistGetOneSuccess(
          item: currentState.item,
          total: event.total,
          diff: event.id,
        );
      }
    }*/

    if(event is WishlistGetAll){
      appWishlist.appWishlistContainer = await AppDb.dbLocal.getWishlist();
    }
  }
}
