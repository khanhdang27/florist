import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:florist/blocs/blocs.dart';
import 'package:florist/models/models.dart';
import 'package:meta/meta.dart';
import 'package:florist/repositories/bag_item_repository.dart';

part 'bag_item_event.dart';

part 'bag_item_state.dart';

class BagItemBloc extends Bloc<BagItemEvent, BagItemState> {
  BagItemBloc() : super(BagItemInitial());
  final BagItemRepository bagItemRepository = BagItemRepository();

  @override
  Stream<BagItemState> mapEventToState(
    BagItemEvent event,
  ) async* {
    if (event is AddBagItem) {
      int stt = await bagItemRepository.addBagItem(
          product_id: event.product_id,
          quantity: event.quantity);
      if (stt == 1) {
        yield AddBagItemSuccess();
      } else {
        yield AddBagItemFailed();
      }
    }

    if (event is AddAllBagItem) {
      int stt = await bagItemRepository.addAllBagItem(
          bag_id: event.bag_id,
          wishlist_id: event.wishlist_id,);
      if (stt == 1) {
        yield AddAllBagItemSuccess();
      } else {
        yield AddAllBagItemFailed();
      }
    }

    if (event is BagChangeQuantity) {
      int total = await bagItemRepository.bagChangeQuantity(
          key: event.key, quantity: event.quantity);
      if (total != null) {
        yield BagChangeQuantitySuccess(
          total: total,
        );
      } else {
        yield BagChangeQuantityFailed();
      }
    }

    if (event is BagDeleteItem) {
      Map bag = await bagItemRepository.bagDeleteItem(
          key: event.key); //item con lai, total
      BagState bagState = AppBloc.bagBloc.state;
      if (bagState is BagGetOneSuccess) {
        AppBloc.bagBloc.add(BagDelete(key: event.key, total: bag['total']));
      }
    }
  }
}
