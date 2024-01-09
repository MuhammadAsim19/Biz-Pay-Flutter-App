part of 'all_business_cubit.dart';

@immutable
abstract class AllBusinessState {}

class AllBusinessInitial extends AllBusinessState {}

class AllBusinessLoading extends AllBusinessState {}

class AllBusinessLoaded extends AllBusinessState {
  final List<BusinessModel>? business;

  AllBusinessLoaded({this.business});
}

class BusinessByIdLoaded extends AllBusinessState {
  final BusinessModel? business;

  BusinessByIdLoaded({this.business});
}

class AllBusinessError extends AllBusinessState {
  final String? error;

  AllBusinessError({this.error});
}
