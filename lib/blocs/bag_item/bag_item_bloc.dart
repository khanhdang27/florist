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
          productId: event.productId,
          quantity: event.quantity);
      if (stt == 1 ) {
        AppBloc.bagBloc.add(BagGetOne());
      } else {
        yield AddBagItemFailed();
      }
    }

    if (event is AddAllBagItem) {
      int stt = await bagItemRepository.addAllBagItem(
          bagId: event.bagId,
          wishlistId: event.wishlistId,);
      if (stt == 1) {
        yield AddAllBagItemSuccess();
      } else {
        yield AddAllBagItemFailed();
      }
    }

    if (event is BagChangeQuantity) {
      Map result = await bagItemRepository.bagChangeQuantity(
          key: event.key, quantity: event.quantity);
      if (result != null) {
        yield BagChangeQuantitySuccess(
          bag: result['bag'],
          total: result['total'],
        );
      } else {
        yield BagChangeQuantityFailed();
      }
    }

    if (event is BagDeleteItem) {
      Map result = await bagItemRepository.bagDeleteItem(
          key: event.key); //item con lai, total
      BagState bagState = AppBloc.bagBloc.state;
      if (bagState is BagGetOneSuccess) {
        AppBloc.bagBloc.add(BagDelete(key: event.key, bag: result['bag'], total: result['total']));
        yield BagDeleteItemSuccess();
      }
    }
  }
}
