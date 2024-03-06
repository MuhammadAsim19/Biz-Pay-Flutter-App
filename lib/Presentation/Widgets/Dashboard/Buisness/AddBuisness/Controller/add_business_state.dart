part of 'add_business_cubit.dart';

@immutable
abstract class AddBusinessState {}

class AddBusinessInitial extends AddBusinessState {}

class AddBusinessLoading extends AddBusinessState {}

class AddBusinessLoaded extends AddBusinessState {
  final String? businessId;

  AddBusinessLoaded({this.businessId});
}

class AddBusinessError extends AddBusinessState {
  final String? error;

  AddBusinessError({this.error});
}
