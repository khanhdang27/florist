part of 'bag_bloc.dart';

@immutable
abstract class BagEvent {}

class BagGetOne extends BagEvent {}

class BagDelete extends BagEvent {
  final String key;
  final int total;

  BagDelete({this.key, this.total});
}
class UpdateBag extends BagEvent {
  final int id;
  final String name;
  final String phone;
  final String address;
  final String pay;

  UpdateBag({this.id, this.name, this.pay, this.phone, this.address});
}