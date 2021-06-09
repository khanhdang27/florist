part of 'product_bloc.dart';

@immutable
abstract class ProductState{}

class ProductInitial extends ProductState {}

class ProductGetRecomSuccess extends ProductState{
  final List<Product> items;

  ProductGetRecomSuccess({this.items});
}

class ProductGetRecomFailed extends ProductState{}

class ProductGetOfCateSuccess extends ProductState{
  final List<Product> items;

  ProductGetOfCateSuccess({this.items});
}

class ProductGetOfCateFailed extends ProductState{}

class ProductGetOneSuccess extends ProductState{
  final Product item;

  ProductGetOneSuccess({this.item});
}

class ProductGetOneFailed extends ProductState{}


