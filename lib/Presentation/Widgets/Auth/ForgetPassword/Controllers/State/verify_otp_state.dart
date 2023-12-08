part of '../verify_otp_cubit.dart';

@immutable
abstract class VerifyOtpState {}

class VerifyOtpInitial extends VerifyOtpState {}

class VerifyOtpLoading extends VerifyOtpState {}

class VerifyOtpLoaded extends VerifyOtpState {
  final String? otpToken;

  VerifyOtpLoaded({this.otpToken});
}

class VerifyOtpError extends VerifyOtpState {
  final String? error;

  VerifyOtpError({this.error});
}
