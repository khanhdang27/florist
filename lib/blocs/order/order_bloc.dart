import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:florist/models/models.dart';
import 'package:florist/repositories/order_repository.dart';
import 'package:meta/meta.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderBloc() : super(OrderInitial());
  final OrderRepository orderRepository = OrderRepository();

  @override
  Stream<OrderState> mapEventToState(OrderEvent event,) async* {
    if (event is OrderGetAll) {
      List<Order> orders = await orderRepository.getAllOrder(event.memberId);
      if (true) {
        yield OrderGetAllSuccess(
          items: orders,
        );
      } else {
        yield OrderGetAllFailed();
      }
    }

    if (event is OrderGetOne) {
      Order order = await orderRepository.getOneOrder(event.orderId);
      if (true) {
        yield OrderGetOneSuccess(
          item: order,
        );
      } else {
        yield OrderGetOneFailed();
      }
    }

    if (event is OrderAdd) {
      int stt = await orderRepository.addOrder(
        bag_id: event.bag_id,
        subtotal: event.subtotal,
        total: event.total,
      );
      if (stt == 1) {
        yield AddOrderSuccess();
      } else {
        yield AddOrderFailed();
      }
    }
  }
}
