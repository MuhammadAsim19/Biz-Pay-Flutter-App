part of '../Controller/SocialCubit/social_login_cubit.dart';

@immutable
abstract class SocialLoginState {}

class SocialLoginInitial extends SocialLoginState {}
class SocialLoginLoading extends SocialLoginState {}
class SocialLoginSuccess extends SocialLoginState {
  final UserModel data;
  SocialLoginSuccess({required this.data});


}
class SocialLoginError extends SocialLoginState {
  final String message;
  SocialLoginError({required this.message});
}
//class SocialLoginError extends SocialLoginState {}
