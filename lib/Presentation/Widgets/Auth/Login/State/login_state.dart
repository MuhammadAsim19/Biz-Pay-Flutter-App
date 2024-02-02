part of '../Controllers/login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginLoaded extends LoginState {
  final UserModel? userData;

  LoginLoaded({this.userData});
}

class LoginError extends LoginState {
  final String? error;

  LoginError({this.error});
}
