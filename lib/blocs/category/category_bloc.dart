import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:florist/models/models.dart';
import 'package:florist/repositories/category_repository.dart';
import 'package:meta/meta.dart';

part 'category_event.dart';

part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc() : super(CategoryInitial());
  final CategoryRepository categoryRepository = CategoryRepository();

  @override
  Stream<CategoryState> mapEventToState(CategoryEvent event) async* {
    if (event is CategoryGetAll) {
      List<Category> categories = await categoryRepository.getAll();
      if (true) {
        yield CategoryGetAllSuccess(
          items: categories,
        );
      } else {
        yield CategoryGetAllFailed();
      }
    }
  }
}
