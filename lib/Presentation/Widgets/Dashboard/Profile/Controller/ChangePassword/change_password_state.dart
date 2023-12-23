part of 'change_password_cubit.dart';

@immutable
abstract class ChangePasswordState {}

class ChangePasswordInitial extends ChangePasswordState {}

class ChangePasswordLoading extends ChangePasswordState {}

class ChangePasswordLoaded extends ChangePasswordState {}

class ChangePasswordError extends ChangePasswordState {
  final String? error;

  ChangePasswordError({this.error});
}
