part of 'category_business_cubit.dart';

@immutable
abstract class CategoryBusinessState {}

class CategoryBusinessInitial extends CategoryBusinessState {}

class CategoryBusinessLoading extends CategoryBusinessState {}

class CategoryBusinessLoaded extends CategoryBusinessState {
  final List<BusinessModel>? business;

  CategoryBusinessLoaded({this.business});
}

class CategoryBusinessError extends CategoryBusinessState {
  final String? error;

  CategoryBusinessError({this.error});
}
