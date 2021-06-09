part of 'product_bloc.dart';

@immutable
abstract class ProductEvent{}

class ProductReset extends ProductEvent {}

class ProductGetRecom extends ProductEvent {}

class ProductGetOfCate extends ProductEvent {
  final int categoryId;

  ProductGetOfCate({this.categoryId});
}

class ProductGetOne extends ProductEvent {
  final int Id;

  ProductGetOne({this.Id});
}