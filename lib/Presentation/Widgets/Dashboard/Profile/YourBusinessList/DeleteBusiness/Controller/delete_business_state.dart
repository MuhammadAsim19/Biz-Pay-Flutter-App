part of 'delete_business_cubit.dart';

@immutable
abstract class DeleteBusinessState {}

class DeleteBusinessInitial extends DeleteBusinessState {}

class DeleteBusinessLoading extends DeleteBusinessState {}

class DeleteBusinessLoaded extends DeleteBusinessState {}

class DeleteBusinessError extends DeleteBusinessState {
  final String? error;

  DeleteBusinessError({this.error});
}
