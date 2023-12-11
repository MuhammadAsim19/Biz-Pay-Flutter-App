part of '../verify_email_cubit.dart';

@immutable
abstract class VerifyEmailState {}

class VerifyEmailInitial extends VerifyEmailState {}

class VerifyEmailLoading extends VerifyEmailState {}

class VerifyEmailLoaded extends VerifyEmailState {

  final String? userId;
  final bool? loading;

  VerifyEmailLoaded({this.userId, this.loading});
}

class VerifyEmailError extends VerifyEmailState {
  final String? error;

  VerifyEmailError({this.error});
}
