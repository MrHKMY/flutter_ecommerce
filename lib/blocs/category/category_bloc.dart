import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:e_commerce/model/models.dart';
import 'package:e_commerce/repositories/category/category_repository.dart';
import 'package:equatable/equatable.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepository _categoryRepository;
  StreamSubscription? _categorySubscription;

  CategoryBloc({required CategoryRepository categoryRepository})
      : _categoryRepository = categoryRepository,
        super(CategoryLoading()) {
    on<LoadCategories>(_onLoadCategories);
    on<UpdateCategories>(_onUpdateCategories);
  }

  void _onLoadCategories(event, Emitter<CategoryState> emit) {
    _categorySubscription?.cancel();
    _categorySubscription =
        _categoryRepository.getAllCategories().listen((categories) {
      return add(UpdateCategories(categories));
    });
  }

  void _onUpdateCategories(event, Emitter<CategoryState> emit) {
    emit(CategoryLoaded(categories: event.categories));
  }
}
