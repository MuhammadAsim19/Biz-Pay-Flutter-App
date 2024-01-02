part of 'update_business_cubit.dart';

@immutable
abstract class UpdateBusinessState {}

class UpdateBusinessInitial extends UpdateBusinessState {}

class UpdateBusinessLoading extends UpdateBusinessState {}

class UpdateBusinessLoaded extends UpdateBusinessState {}

class UpdateBusinessError extends UpdateBusinessState {
  final String? error;

  UpdateBusinessError({this.error});
}
