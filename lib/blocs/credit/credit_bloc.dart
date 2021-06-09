import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:florist/models/models.dart';
import 'package:florist/repositories/credit_repository.dart';
import 'package:meta/meta.dart';

part 'credit_event.dart';

part 'credit_state.dart';

class CreditBloc extends Bloc<CreditEvent, CreditState> {
  CreditBloc() : super(CreditInitial());
  final CreditRepository creditRepository = CreditRepository();

  @override
  Stream<CreditState> mapEventToState(CreditEvent event,) async* {
    if (event is CreditGetOne) {
      Credit credit = await creditRepository.getOne(Id: event.Id);
      if (true) {
        yield CreditGetOneSuccess(
          item: credit,
        );
      } else {
        yield CreditGetOneFailed();
      }
    }

    if (event is UpdateCredit) {
      int result = await creditRepository.updateCredit(
        id: event.id,
        expiry: event.expiry,
        code: event.code,
        cvv: event.cvv,
      );
      if (result != null) {
        yield UpdateCreditSuccess();
      } else {
        yield UpdateCreditFailed();
      }
    }
  }
}
