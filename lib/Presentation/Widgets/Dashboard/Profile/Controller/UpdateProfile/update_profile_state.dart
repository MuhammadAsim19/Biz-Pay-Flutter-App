part of 'update_profile_cubit.dart';

@immutable
abstract class UpdateProfileState {}

class UpdateProfileInitial extends UpdateProfileState {}

class UpdateProfileLoading extends UpdateProfileState {}

class UpdateProfileLoaded extends UpdateProfileState {}

class UpdateProfileError extends UpdateProfileState {
  final String? error;

  UpdateProfileError({this.error});
}
