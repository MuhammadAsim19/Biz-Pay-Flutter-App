part of '../Controllers/sign_up_cubit.dart';

@immutable
abstract class SignUpState {}

class SignUpInitial extends SignUpState {}

class SignUpLoading extends SignUpState {}

class SignUpLoaded extends SignUpState {
  final UserModel? userModel;

  SignUpLoaded({this.userModel});
}

class SignUpError extends SignUpState {
  final String? error;

  SignUpError({this.error});
}
