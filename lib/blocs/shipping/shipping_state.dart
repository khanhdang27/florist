part of 'shipping_bloc.dart';

@immutable
abstract class ShippingState {}

class ShippingInitial extends ShippingState {}

class ShippingGetOneSuccess extends ShippingState{
  final Shipping item;

  ShippingGetOneSuccess({this.item});
}

class ShippingGetOneFailed extends ShippingState{}

class UpdateShippingSuccess extends ShippingState{}
class UpdateShippingFailed extends ShippingState{}
