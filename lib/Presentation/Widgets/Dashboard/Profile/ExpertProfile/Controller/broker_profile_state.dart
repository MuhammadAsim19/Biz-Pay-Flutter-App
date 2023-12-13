part of 'broker_profile_cubit.dart';

@immutable
abstract class BrokerProfileState {}

class BrokerProfileInitial extends BrokerProfileState {}

class BrokerProfileLoading extends BrokerProfileState {}

class BrokerProfileLoaded extends BrokerProfileState {}

class BrokerProfileError extends BrokerProfileState {
  final String? error;

  BrokerProfileError({this.error});
}
