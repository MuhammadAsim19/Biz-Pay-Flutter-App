part of '../set_password_cubit.dart';

@immutable
abstract class SetPasswordState {}

class SetPasswordInitial extends SetPasswordState {}

class SetPasswordLoading extends SetPasswordState {}

class SetPasswordLoaded extends SetPasswordState {}

class SetPasswordError extends SetPasswordState {
  final String? error;

  SetPasswordError({this.error});
}
