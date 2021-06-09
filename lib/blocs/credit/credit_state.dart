part of 'credit_bloc.dart';

@immutable
abstract class CreditState {}

class CreditInitial extends CreditState {}

class CreditGetOneSuccess extends CreditState{
  final Credit item;

  CreditGetOneSuccess({this.item});
}

class CreditGetOneFailed extends CreditState{}

class UpdateCreditSuccess extends CreditState{}
class UpdateCreditFailed extends CreditState{}

