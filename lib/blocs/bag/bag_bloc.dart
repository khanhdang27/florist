import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:florist/models/models.dart';
import 'package:florist/repositories/bag_repository.dart';
import 'package:meta/meta.dart';

part 'bag_event.dart';
part 'bag_state.dart';

class BagBloc extends Bloc<BagEvent, BagState> {
  BagBloc() : super(BagInitial());
  final BagRepository bagRepository = BagRepository();

  @override
  Stream<BagState> mapEventToState(BagEvent event) async* {
    if (event is BagGetOne) {
      Map result = await bagRepository.getOne();
      if (true) {
        yield BagGetOneSuccess(
          bag: result['bag'],
          total: result['total'],
        );
      }
    }
    if (event is BagDelete) {
      var currentState = state; //BagGetOneSuccess
      if (currentState is BagGetOneSuccess) {
        currentState.bag.items.removeWhere((element) {
          return element.key == event.key;
        });
        yield BagGetOneSuccess(
          bag: event.bag,
          total: event.total,
          diff: event.key,
        );
      }
    }
    if (event is UpdateBag) {
      int result = await bagRepository.updateBag(
        id: event.id,
        name: event.name,
        phone: event.phone,
        address: event.address,
        pay: event.pay,
      );
      if (result != null) {
        yield UpdateBagSuccess();
      } else {
        yield UpdateBagFailed();
      }
    }
  }
}
