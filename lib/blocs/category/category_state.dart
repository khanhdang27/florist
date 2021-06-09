part of 'category_bloc.dart';

@immutable
abstract class CategoryState {}

class CategoryInitial extends CategoryState {}

class CategoryGetAllSuccess extends CategoryState {
  final List<Category> items;

  CategoryGetAllSuccess({this.items});
}
class CategoryGetAllFailed extends CategoryState {}