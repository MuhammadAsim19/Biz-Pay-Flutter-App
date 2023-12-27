part of 'delete_account_cubit.dart';

@immutable
abstract class DeleteAccountState {}

class DeleteAccountInitial extends DeleteAccountState {}

class DeleteAccountLoading extends DeleteAccountState {}

class DeleteAccountLoaded extends DeleteAccountState {}

class DeleteAccountError extends DeleteAccountState {
  final String? error;

  DeleteAccountError({this.error});
}
