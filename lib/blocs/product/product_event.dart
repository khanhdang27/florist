part of 'product_bloc.dart';

@immutable
abstract class ProductEvent{}

class ProductReset extends ProductEvent {}

class ProductGetRecom extends ProductEvent {}

class ProductGetOfCate extends ProductEvent {
  final int categoryId;
  final String sort;
  final double minPrice;
  final double maxPrice;

  ProductGetOfCate({this.categoryId, this.sort, this.minPrice, this.maxPrice});
}

class ProductGetOne extends ProductEvent {
  final int id;

  ProductGetOne({this.id});
}