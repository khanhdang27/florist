part of 'order_bloc.dart';

@immutable
abstract class OrderEvent {}
class OrderGetAll extends OrderEvent {
  final int memberId;

  OrderGetAll({this.memberId});
}
class OrderGetOne extends OrderEvent {
  final int orderId;

  OrderGetOne({this.orderId});
}
class OrderAdd extends OrderEvent {
  final int bagId;
  final int subtotal;
  final int total;

  OrderAdd({this.bagId, this.subtotal, this.total });
}