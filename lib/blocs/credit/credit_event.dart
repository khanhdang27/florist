part of 'credit_bloc.dart';

@immutable
abstract class CreditEvent {}

class CreditGetOne extends CreditEvent {
  final int Id;

  CreditGetOne({this.Id});
}

class UpdateCredit extends CreditEvent {
  final int id;
  final String expiry;
  final String code;
  final String cvv;

  UpdateCredit({this.id, this.expiry, this.code, this.cvv});
}