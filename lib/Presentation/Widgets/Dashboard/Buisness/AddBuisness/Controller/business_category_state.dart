part of 'business_category_cubit.dart';

@immutable
abstract class BusinessCategoryState {}

class BusinessCategoryInitial extends BusinessCategoryState {}

class BusinessCategoryLoading extends BusinessCategoryState {}

class BusinessCategoryLoaded extends BusinessCategoryState {
  final List<BusinessCategory>? list;

  BusinessCategoryLoaded({this.list});
}

class BusinessCategoryError extends BusinessCategoryState {
  final String? error;

  BusinessCategoryError({this.error});
}
