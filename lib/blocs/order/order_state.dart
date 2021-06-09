part of 'order_bloc.dart';

@immutable
abstract class OrderState {}

class OrderInitial extends OrderState {}
class OrderGetAllSuccess extends OrderState{
  final List<Order> items;

  OrderGetAllSuccess({this.items});
}

class OrderGetAllFailed extends OrderState{}
class OrderGetOneSuccess extends OrderState{
  final Order item;

  OrderGetOneSuccess({this.item});
}

class OrderGetOneFailed extends OrderState{}

class AddOrderSuccess extends OrderState{}
class AddOrderFailed extends OrderState{}