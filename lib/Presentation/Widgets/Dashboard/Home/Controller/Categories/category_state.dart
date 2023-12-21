part of 'category_cubit.dart';

@immutable
abstract class CategoryState {}

class CategoryInitial extends CategoryState {}

class CategoryLoading extends CategoryState {}

class CategoryLoaded extends CategoryState {
  final List<Category>? model;

  CategoryLoaded({this.model});
}

class CategoryError extends CategoryState {
  final String? error;

  CategoryError({this.error});
}
