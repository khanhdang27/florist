part of 'shipping_bloc.dart';

@immutable
abstract class ShippingEvent {}
class ShippingGetOne extends ShippingEvent {
  final int Id;

  ShippingGetOne({this.Id});
}

class UpdateShipping extends ShippingEvent {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String address;

  UpdateShipping({this.id, this.name, this.email, this.phone, this.address});
}